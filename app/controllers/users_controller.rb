class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user_params[:password] == user_params[:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to :controller => 'welcome', :action => 'homepage'
    else
      flash[:message] = "Passwords must match."
      redirect_to :controller => 'users', :action => 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
