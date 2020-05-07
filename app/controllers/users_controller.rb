class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    list
    render :action => 'list'
  end

  def list
    @users = User.all
  end

  def show
  end

  def edit
    # @user = current_user.users.new(user_params)
  end

  def create

  end
end
