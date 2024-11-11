class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
  end

  private

  def require_login
    if user_signed_in?
      # allow user to perform actions
    else
      redirect_to new_user_session_path
    end
  end
end
