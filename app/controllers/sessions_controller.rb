class SessionsController < ApplicationController
  def create
    user = User.find_by(name: user_params[:name])
   authenticated = user.try(:authenticate, user_params[:password])
   return head(:forbidden) unless authenticated
   @user = user
   session[:user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
