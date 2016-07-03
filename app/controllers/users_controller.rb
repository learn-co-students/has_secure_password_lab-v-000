class UsersController < ApplicationController
  before_action :require_logged_in, only: [:home]

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation] && !params[:user][:password].blank?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end

  def home
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
