class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user) 
      redirect_to '/users'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
