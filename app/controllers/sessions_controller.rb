class SessionsController < ApplicationController
  
  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
    # params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
