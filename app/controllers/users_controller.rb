class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      session[:name] = params[:user][:name]
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
