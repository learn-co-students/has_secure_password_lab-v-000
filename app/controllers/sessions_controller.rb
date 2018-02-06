class SessionsController < ApplicationController

  def home

  end

  def new
    @user = User.new
    redirect_to welcome_path, alert: "Please log out first!" if logged_in?
  end


  def create
    user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])

    return redirect_to login_path, alert: "Login failed!" unless user

    session[:user_id] = user.id
    redirect_to welcome_path, alert: "Successfully logged in."
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path, alert: "Successfully logged out."
  end

end
