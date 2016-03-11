class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id
      redirect_to '/users/show' 
    else
      redirect_to '/users/new', notice: "The confirmation doesn't match."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end      
end
