class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      redirect_to '/users/new'
    end
  end
end
