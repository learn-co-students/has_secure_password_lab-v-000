class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id

    if params[:password] == params[:password_confirmation]
      redirect_to '/users/new'
    else
      redirect_to '/'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
