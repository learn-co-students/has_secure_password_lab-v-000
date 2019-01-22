class UsersController < ApplicationController

  def index

    redirect_to controller: 'sessions', action: 'new' unless current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def current_user
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    end
  end




  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end



end
