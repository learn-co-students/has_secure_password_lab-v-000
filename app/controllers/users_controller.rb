class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(:name => params[:name])
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
