class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.save
    if params[:password] != params[:password_confirmation]
      redirect_to '/create'
    else
      session[:user_id] = @user.id
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
