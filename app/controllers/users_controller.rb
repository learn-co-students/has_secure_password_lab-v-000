class UsersController < ApplicationController
  def index 
    binding.pry
    @user = User.find_by(id: params[:user_id])
  end 
  def new 
  end 
  def create
    @user = User.create(user_params)
    #raise params
    binding.pry
    if @user.save
      #raise params
      session[:user_id] = @user.id
      redirect_to user_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
