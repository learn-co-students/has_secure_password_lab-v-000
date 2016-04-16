class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    if @user && params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = User.last.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(id: params[:id])
  end

  private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
