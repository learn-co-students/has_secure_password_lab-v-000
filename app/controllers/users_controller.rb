require 'pry'
class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
    #binding.pry
    @user = User.create(user_params)
    @user.save

    if @user.save
      @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to "/"
    end

  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
