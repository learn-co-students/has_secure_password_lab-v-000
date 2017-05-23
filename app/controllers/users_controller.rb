class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    return redirect_to '/signup' unless @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
