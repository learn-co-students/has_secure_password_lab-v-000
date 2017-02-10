class UsersController < ApplicationController
  

  def new
  end

  def create
    @user = User.new(user_params).save 
  end





  private

  def user_params
    params.require(:username).permit(:password, :password_confirmation)
  end
end
