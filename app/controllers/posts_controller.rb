class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  private

  def require_login
    if user_signed_in?
      # allow user to perform actions
    else
      redirect_to new_user_session_path
    end
  end
end
