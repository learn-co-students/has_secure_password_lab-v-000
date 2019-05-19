class UsersController < ApplicationController
  def new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.create(users_params)
      if @user.save
        session[:user_id] = @user.id
      else
        redirect_to '/signup'
      end
    else
      redirect_to '/signup'
    end
  end

  def welcome

  end

  private
  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
