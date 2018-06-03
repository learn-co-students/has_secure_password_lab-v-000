class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to new_session_path
    end
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

end
