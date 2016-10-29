class UsersController < ApplicationController

  def new
  end

  def create
    # Sets password if the confirmation matches
    @user = User.create(user_params)
    # Redirects you if your password and confirmation don't match
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end