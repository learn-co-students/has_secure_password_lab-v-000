class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to "/" #=> GET "/"
  end

  def show
    #@user = User.find_by(session[:user_id])

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
