class ResponseLogs
  def initialize(app)
    @app = app
  end

  def call(env)
    Rails.logger.info(">>>Before #{ObjectSpace.count_objects}")
    data = @app.call(env)
    Rails.logger.info(">>>After #{ObjectSpace.count_objects}")
    data
  end
end