class UsersController < ApplicationController
  
  def login
  end

  def new
  end

  
  def show
  end
  
   def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/users/signup"
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
  
end