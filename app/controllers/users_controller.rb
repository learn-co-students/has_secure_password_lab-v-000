class UsersController < ApplicationController

  def new
    if current_user
      redirect_to login_path
    end
  end

  def create #this should be taken from the signup page, then should log the user in
    @user = User.new(user_params)
    if @user.save && @user.authenticate(params[:user][:password])#no nil values and no repeated usernames
      session[:user_id] = @user.id
      redirect_to home_path(@user) #this should log in a user --PROBLEM: not rendering the login form but going straight to the create action
    else
      flash[:alert] = "Please enter a valid user"
      redirect_to signup_path
    end
  end

  def show #this is the user homepage
    @user = User.find_by(id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
