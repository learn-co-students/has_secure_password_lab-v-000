class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      binding.pry
      redirect_to users_index_path
    else
      binding.pry
      redirect_to users_new_path
    end
  end
  def index

  end

  def new

  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
