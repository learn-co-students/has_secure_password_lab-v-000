class SessionsController < ApplicationController

  def create
    # redirect_to users_path if sess_params[:name].nil?
    @user = User.find_by(name: sess_params[:name])

    return head(:forbidden) unless @user.authenticate(sess_params[:password])
    session[:user_id] = @user.id
    redirect_to users_path
  end

  private

  def sess_params
    params.require(:user).permit(:name, :password)
  end
end
