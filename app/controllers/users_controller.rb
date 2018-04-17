class UsersController < ApplicationController

  def homepage

  end

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to sessions_create_path
    else
      redirect_to new_user_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
