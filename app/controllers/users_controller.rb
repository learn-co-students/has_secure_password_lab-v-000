class UsersController < ApplicationController
  def welcome
    @user = User.find_by(name: params[:name])
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/signup'
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
