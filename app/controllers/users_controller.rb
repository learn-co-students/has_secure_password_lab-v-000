class UsersController < ApplicationController
  def index
    @user = User.find_by(name: params[:name])
  end

  def show
    @user = User.find_by(name: params[:name])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'index'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
