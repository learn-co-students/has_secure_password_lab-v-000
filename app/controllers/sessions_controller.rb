class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to users_show_path
  end



  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
