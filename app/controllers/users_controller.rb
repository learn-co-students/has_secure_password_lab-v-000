class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

   def create
    @user = User.create(user_params)

    if !@user.valid?
        redirect_to new_user_path
    else
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

   private

   def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

 end
     
