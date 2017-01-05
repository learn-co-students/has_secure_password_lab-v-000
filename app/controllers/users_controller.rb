class UsersController < ApplicationController

  def welcome
    redirect_to login_path unless params[:id]

    @user = User.find_by(id: params(:id))
  end

  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to new_user_path unless @user.save
    
    session[:user_id] = @user.id
    redirect_to welcome_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
