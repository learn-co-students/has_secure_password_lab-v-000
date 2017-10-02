class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
     redirect_to '/signup' unless
     @user.authenticate(params[:password])
     @user.save
     session[:user_id] = @user.id 
    # @user
    
  end
  def welcome

  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
