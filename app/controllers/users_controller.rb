class UsersController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end

  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
