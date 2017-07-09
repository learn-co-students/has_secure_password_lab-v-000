class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params)
      redirect_to show_path
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
