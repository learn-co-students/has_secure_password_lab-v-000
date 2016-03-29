class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:notice] = "Passwords don't match!"
      redirect_to new_user_path
    else @user.save
        flash[:notice] = "Welcome"
        session[:user_id] = @user.id
        redirect_to welcome_path(session[:user_id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
