class UsersController < ApplicationController

  def new
  end

  def create #create new user
    @user = User.new(user_params)
    if user_params[:password] == user_params[:password_confirmation]  
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path #if pass & pass confirmation dont match, redirect to New User Path
    end
  end
  
  def show 
    @user = User.find(params[:id])
  end 


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end