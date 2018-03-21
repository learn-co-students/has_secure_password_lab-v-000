class UsersController < ApplicationController

# UsersController create creates a new user
# UsersController create sets your password if the confirmation matches
# UsersController create redirects you if your password and confirmation don't match

  def new
    #user = User.new
  end

  def create
    @user = User.new
    @user.password = params[:user][:password]
    @user.name = params[:user][:name]
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
# UsersController create logs you in
      redirect_to new_user_path
    else
      render '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
