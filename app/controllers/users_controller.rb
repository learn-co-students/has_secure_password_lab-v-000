class UsersController < ApplicationController
require 'pry'
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #binding.pry
      redirect_to '/home'
    else
      redirect_to '/signup'
    end
  end

    def show
      @user = User.find(session[:user_id])
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
