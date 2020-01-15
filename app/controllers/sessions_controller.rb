class SessionsController < ApplicationController
  def login
    @user = User.new # I wonder about this, since I'm calling the User model.
    # Maybe this belongs in the UsersController.
  end
  
  def create
    user = User.find_by_name(params[:user][:name])

    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to home_path # users#home
    else
      flash.alert = "The name and/or password is incorrect."
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    flash.alert = "You have successfully logged out!"
    redirect_to login_path
  end
end
