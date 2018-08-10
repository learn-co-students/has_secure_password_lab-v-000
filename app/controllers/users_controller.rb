class UsersController < ApplicationController

  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(user_params)
      if user.save

        session[:user_id] = user.id
        render 'show'
      else
        redirect_to new_user_path
      end
    else
      redirect_to root_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
