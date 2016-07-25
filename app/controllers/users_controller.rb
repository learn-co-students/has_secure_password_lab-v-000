class UsersController < ApplicationController


def new
render 'signup'
end


def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to signup_path
    else
      redirect_to signup_path
    end
end



private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
 
end
