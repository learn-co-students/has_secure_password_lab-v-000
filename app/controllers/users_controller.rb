class UsersController < ApplicationController

  def new
  end

  def create
    User.new(user_params).save

    if user_params[:password] == user_params[:password_confirmation]
      @user = User.find_by(name: user_params[:name])
      session[:user_id] = @user.id
    else
      redirect_to '/users/new'
    end


    #session[:user_id] = @user.id
    #binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
