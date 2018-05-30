class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      current_user(@user)
      redirect_to "/login"
    else
      redirect_to '/users/new'
    end
  end

end
