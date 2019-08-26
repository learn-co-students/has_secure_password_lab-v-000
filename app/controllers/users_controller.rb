class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to '/users/new' unless @user.save #read up on why return is necessary
    session[:user_id] = @user.id
    redirect_to users_welcome_path
  end

  def welcome
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
