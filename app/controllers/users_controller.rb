class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    session[:user_id] = user.id
    if user.password != user.password_confirmation
      redirect_to '/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
