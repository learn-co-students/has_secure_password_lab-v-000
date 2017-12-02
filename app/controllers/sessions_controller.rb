class SessionsController < ApplicationController
  before_action :current_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by(name: session_params[:name])
    return head(:forbidden) unless @user.authenticate(session_params[:password])
    session[:user_id] = @user.id
    redirect_to session_path(@user)
  end

  def show
  end

  def delete
    session.delete :user_id if current_user
    redirect_to login_path
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
