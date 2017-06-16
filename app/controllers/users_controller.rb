class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(users_param)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  private

    def users_param
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
