require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to homepage_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
