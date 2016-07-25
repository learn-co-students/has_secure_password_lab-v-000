class UsersController < ApplicationController


def new
render 'signup'
end


def create 
  @user = User.new(user_params)
    if @user.valid_user
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid Information"
      redirect_to signup_path
    end
end



private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
 
end
