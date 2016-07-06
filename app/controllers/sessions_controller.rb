class SessionsController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create]
  
  def new
  end
  
  def create
    if params[:user][:password].blank?
      redirect_to new_session_path
    else
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_session_path
      end
    end
  end
  
  def destroy
    session.delete :user_id
    redirect_to new_session_path
  end
end