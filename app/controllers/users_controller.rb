class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show]

  def index

  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.authenticate(params[:user][:password]).save
      session[:user_id] = @user.id
      redirect_to users_url
    else
      redirect_to new_user_url
    end
  end

  private

  def set_user
    @user = User.find_by(id: session[:user_id])
    redirect_to new_user_url unless @user
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
