class UsersController < ApplicationController

# UsersController create creates a new user
# UsersController create sets your password if the confirmation matches
# UsersController create redirects you if your password and confirmation don't match

  def new
    user = User.new
  end

  def create
    @user = User.new
    @user.password = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
# UsersController create logs you in
        redirect_to root_path
    else
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
