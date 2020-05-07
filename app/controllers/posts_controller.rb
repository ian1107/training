class PostsController < ApplicationController
  # around_action :logging_request_response

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def new
    @post = Post.new
    @post.status = 'Draft'
    @post.user_id = 1
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render :action => 'index'
    else
      render :action => 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.status = "Published"
  end

  def destroy
    @post = Post.new(params[:posts])

    errors.add("You are not allowed to delete this post") if @post.user_id != 1
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :status, :user_id)
  end

  def logging_request_response
    # some code needs to go in here
  end
end