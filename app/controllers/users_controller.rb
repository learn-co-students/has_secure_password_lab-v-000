class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
