class UsersController < ApplicationController
  

  def new
    @user = User.new(user_params)
    redirect_to '/new'
  end

  def create
    @user = User.new(user_params).save 

    binding.pry
    redirect_to '/users/new'
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
