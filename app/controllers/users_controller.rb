class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if params[:user][:password] != params[:user][:password_confirmation]
        flash[:alert] = "Password doesnt match"
        redirect_to new_users_path
      else
        @user.save
        session[:user_id] = @user.id
      end
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
