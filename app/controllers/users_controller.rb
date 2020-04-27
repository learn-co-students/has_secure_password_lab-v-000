class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.nil?
      @user = User.new(user_params)
      if @user.save
        session[:user_id]=@user.id
        redirect_to welcome_home_path
      else
        redirect_to signup_path
      end
    else
      redirect_to login_path, alert:"Users already exists, please enter pwd"
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
