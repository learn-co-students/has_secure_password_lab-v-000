class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.password == user.password_confirmation
      log_in user
      flash[:notice] = "You have successfully signed up."
      redirect_to user
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
