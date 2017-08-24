class UsersController < ApplicationController
  def new
  end

  def create
    new_user = User.new(user_params)
    if new_user.valid?
      new_user.save
      session[:user_id] = new_user.id
    else
      redirect_to '/users/new'
    end
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end
