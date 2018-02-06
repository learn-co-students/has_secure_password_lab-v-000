class SessionsController < ApplicationController

  def home

  end

  def new
  end


  def create

    user = User.find_by(name: params[:name]).try(:authenticate, params[:password])

    return redirect_to login_path, alert: "Login failed!"  unless user

    session[:user_id] = user.id
    redirect_to welcome_path, alert: "Successfully logged in."
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path, alert: "Successfully logged out."
  end

end
