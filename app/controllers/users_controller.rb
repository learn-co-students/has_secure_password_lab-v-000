class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if !@user.save || params[:user][:name].empty?
      redirect_to signup_path
    else
      session[:user_id] = @user.id
      redirect_to welcome_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
