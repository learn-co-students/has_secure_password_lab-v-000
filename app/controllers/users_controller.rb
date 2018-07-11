class UsersController < ApplicationController

  def home
    if session[:user_id].nil?
      redirect_to '/login'
    else
      @user = User.find_by(id: session[:user_id])
    end
  end

  def new
  end

  def create
    if User.new(user_params).save
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

end
