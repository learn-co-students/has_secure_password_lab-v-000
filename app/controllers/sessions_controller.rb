class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      flash[:notice] = 'Incorrect password. Please try again.'
      redirect_to login_path
    end

  end
  
  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end
