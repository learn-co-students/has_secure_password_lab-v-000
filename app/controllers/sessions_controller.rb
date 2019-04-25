class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  end

  private

  def session_params
    params.require(:session).permit(:user_id)
  end
end
