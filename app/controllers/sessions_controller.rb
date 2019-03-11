class SessionsController < ApplicationController

  def new
  end

  def create #create new session, find user
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :name
    redirect_to '/login'
  end

end
