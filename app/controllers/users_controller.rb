class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "you have been signed up"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to users_new_path
    end
  end

  def show
    current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
