class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #Needs to create a new user with params, if can be saved, assign session to current user, and redirect to welcome/home page else redirect to new user signup
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
