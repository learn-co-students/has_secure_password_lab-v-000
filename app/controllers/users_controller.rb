class UsersController < ApplicationController

  def welcome
    require_logged_in
  end

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render :welcome
    else
      redirect_to signup_path
    end
  end

end
