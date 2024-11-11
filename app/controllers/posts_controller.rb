class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  private

  def require_login
    if user_signed_in?
      # allow user to perform actions
    else
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.expect(post: [:body])
  end
end
