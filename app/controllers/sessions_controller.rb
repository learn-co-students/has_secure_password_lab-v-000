class SessionsController < ApplicationController

  def new

  end

  def show
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

    redirect_to '/'
  end

  def destroy
    session.destroy :name
    redirect_to new_session_path
  end
end
