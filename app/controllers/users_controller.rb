class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise.params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def welcome
    if current_user
      @user = current_user
    else
      redirect_to sessions_new_path
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end