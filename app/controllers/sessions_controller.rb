class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to :controller => "welcome", :action => "home"
  end

  def destroy
    if current_user
      session.delete :user_id

      redirect_to '/'
    end
  end



end
