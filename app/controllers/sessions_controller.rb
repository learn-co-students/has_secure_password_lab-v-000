class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: login_params[:name])
    if @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      return head(:forbidden)
    end
  end

  private

  def login_params
    params.require(:user).permit(:name, :password)
  end
end