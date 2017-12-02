class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to session_path(@user)
    else
      binding.pry
      if @user.errors.messages[:name]
        flash[:notice] = "Error Creating Account. Username taken."
      else
        flash[:notice] = "Error Creating Account. Passwords don't match."
      end
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
end
