class SessionsController < ApplicationController

  def new #login, should have a view that has login form
  end

  def create #should check if user is authenticated, log them in
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/homepage'
    else
      redirect_to '/login'
    end
  end

  def destroy #logout
    session[:user_id] = nil
    redirect_to 'login'
  end

end
