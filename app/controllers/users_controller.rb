class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
