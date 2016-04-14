class SessionsController < ApplicationController
  def create
    if set_user
    # return head(:forbidden) unless params[:password] == user.password_digest
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      redirect_to login_path
    end
  end
end
