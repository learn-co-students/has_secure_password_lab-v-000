class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = @user.errors.full_messages.uniq.join(', ')
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if !logged_in?
      redirect_to "/login"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
