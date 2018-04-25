class UsersController < ApplicationController

  def new
  end

  def create
    if params[:user][:password]==params[:user][:password_confirmation]
      @user=User.create(user_params)
      session[:user_id]=@user.id
      redirect_to '/users/homepage'
    else
      redirect_to '/users/new'
    end
  end

  def homepage
    @user=User.find_by(id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
