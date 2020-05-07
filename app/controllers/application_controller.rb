# require_relative 'boot'

require 'rails/all'

# bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application

    # config.load_defaults 5.0.3

    # config.middleware.use "CanCan"
    # config.middleware.use "Devise"

    config.middleware.use "ResponseLogs"
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
