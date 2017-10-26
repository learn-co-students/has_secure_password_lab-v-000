class UsersController < ApplicationController

  def new
    @user = User.new
    render :signup
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :welcome
    else
      render :signup
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
