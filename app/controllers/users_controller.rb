class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new
      @user.name = params[:user][:name]
      @user.password = params[:user][:password]
      @user.save
      session[:user_id] = @user.id

      render 'show'
    else

      redirect_to new_user_path
    end
  end

  def show

  end

  # private
  #
  # def user_params
  #   params.require(:user).permit(:username, :password, :password_confirmation)
  # end

end
