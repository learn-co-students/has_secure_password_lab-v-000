class SessionsController < ApplicationController
  def new
    @user = User.new
    redirect_to '/' if in_session?
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "Login failed."
      redirect_to new_session_url
    end
  end

  def destroy
    session.delete :user_id unless session[:user_id].nil?
    redirect_to '/'
  end
end
