class SessionsController < ApplicationController
  def create
    #find the user, try to authenticate with password, redirect to login unless password is correct, assign session to user's id, redirect to home page
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless user
    session[:user_id] = user.id
    @user = user
    redirect_to root_path
  end
end
