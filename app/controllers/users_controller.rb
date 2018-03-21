class UsersController < ApplicationController
  before_action :confirm_password, only: [:create]
  
  def home
  end
  
  def new
    @user = User.new
  end
  
  def create
    # binding.pry
    @user = User.create(user_params)
    
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to users_new_path
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
  def confirm_password
    password_confirmed= params[:user][:password] == params[:user][:password_confirmation]
    redirect_to users_new_path unless password_confirmed
  end
end
