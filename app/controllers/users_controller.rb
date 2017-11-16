class UsersController < ApplicationController
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      flash[:notice] = "Password Correct"
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to new_path
    else
      flash[:notice] = "Incorrect Password. Please Try Again"
      redirect_to new_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
