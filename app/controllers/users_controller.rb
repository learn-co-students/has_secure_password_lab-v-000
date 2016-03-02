class UsersController < ApplicationController
  def new
  end

  def create
    # binding.pry
    user = User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect_to user 
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = user.find(session[:user_id])
  end
end
