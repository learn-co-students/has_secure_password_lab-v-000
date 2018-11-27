class SessionsController < ApplicationController

  def new
    
  end

  def create
    if(user = User.find_by(name: params[:user][:name]))
      return head(:forbidden) unless user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to welcome_index_path
    else
      flash[:alert] = "Improper credentials entered"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
