class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to(controller: 'users', action: 'show')
    else
      redirect_to(controller: 'users', action: 'new')
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
