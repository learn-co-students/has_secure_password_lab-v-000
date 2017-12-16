class UsersController < ApplicationController
  def new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:alert] = "The username or password is invalid"
        redirect_to users_path
      end
    else
      flash[:alert] = "Password and Password Confirmation must match"
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
