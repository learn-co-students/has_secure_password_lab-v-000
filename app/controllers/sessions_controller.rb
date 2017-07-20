class SessionsController < ApplicationController
  def create
    @user = User.find_by(params.require(:user).permit(:name))
    return head(:forbidden) unless @user.authenticate(params.require(:user).permit(:password)[:password])
    session[:user_id] = @user.id
    redirect_to users_homepage_path
  end
end
