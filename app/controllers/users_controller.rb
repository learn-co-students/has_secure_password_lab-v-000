class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #this is to create a new user object in the DB
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/users/new', alert: "Passwords must match!"
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
