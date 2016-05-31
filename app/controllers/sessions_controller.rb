class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    
    if user && authenticated
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Try again."
      return head(:forbidden) unless authenticated
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end
end
