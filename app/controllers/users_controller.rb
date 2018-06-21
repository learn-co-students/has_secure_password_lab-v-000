class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    if params[:user] != nil
    @user = User.create(user_params)
      if params[:user][:password] == params[:user][:password_confirmation]
        session[:user_id]=@user.id
        redirect_to @user
      else
        redirect_to "/users/new"
      end
    end
  end

  def show
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
