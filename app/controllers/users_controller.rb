class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login
      redirect_to user_path(@user)
    else
      flash[:message] = "#{@user.errors.full_messages}"
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
