class UsersController < ApplicationController

  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params).save
      @user = User.find_by(name: user_params[:name])
      session[:user_id] = @user.id
      render :show
    else
      redirect_to '/users/new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
