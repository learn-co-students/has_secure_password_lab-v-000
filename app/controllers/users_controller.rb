class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    if params[:password] == params[:password_confirmation] && @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(params[:name])
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
end
