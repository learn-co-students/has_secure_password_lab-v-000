class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/homepage'
    else
      redirect_to '/signup'
    end
  end

  def homepage
    @user = User.find[params[id]]
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
