class UsersController < ApplicationController

  def current_user
    session[:name]
  end

  def new
  end

  def create
    @user=User.create(user_params)
      return redirect_to '/users/new' unless @user.save
      @user.id=session[:user_id]
      redirect_to '/users/homepage'
  end

  def homepage
    if current_user
      @user=current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
