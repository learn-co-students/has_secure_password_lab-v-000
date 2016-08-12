class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_index_path
    else
      redirect_to new_user_path
    end
  end

  private
  def set_user
    @user = User.find(params[:name])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
