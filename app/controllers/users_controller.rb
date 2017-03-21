class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/welcome/show'
      else
        redirect_to '/users/new'
      end
    else
      redirect_to '/users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
