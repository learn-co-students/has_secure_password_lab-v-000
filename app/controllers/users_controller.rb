class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    return redirect_to new_user_path unless confirmation_match

    user = User.create(strong_params)

    session[:user_id] = user.id
    redirect_to welcome_path
  end

  def welcome
    @user = User.find(session[:user_id])
  end

  def strong_params
    params.require(:user).permit(*%i[name password])
  end

  def confirmation_match
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
