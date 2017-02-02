class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
    if user.save
      session[:user_id] = user.id
      render 'welcome'
    else
      redirect_to users_new_path
    end
  end

  def welcome
  end
end
