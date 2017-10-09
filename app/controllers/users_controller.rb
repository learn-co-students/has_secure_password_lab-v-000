class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
