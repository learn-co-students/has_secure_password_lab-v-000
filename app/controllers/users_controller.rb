class UsersController < ApplicationController
  
  def home
    redirect_to login_path unless logged_in?
  end

  def new

  end

  def create
# byebug
    @user=User.new(user_params)
    if @user.save
      login(@user.id)
      redirect_to root_path
    else
      redirect_to users_new_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

 
end
