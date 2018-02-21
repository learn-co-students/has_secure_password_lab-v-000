class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #binding.pry
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
    else
    @user = User.create(user_params)
    #binding.pry
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
  end

    private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
end
