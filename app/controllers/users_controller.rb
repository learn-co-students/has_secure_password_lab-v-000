class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to homepage_path
    else
      @user = User.new
    end
  end

  def homepage
    if logged_in?
      render :homepage
    else
      flash[:notice] = "You need to be logged in to do that."
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/users/homepage'
      else
        flash[:notice] = "User could not be created. Please try again."
        redirect_to new_user_path
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
