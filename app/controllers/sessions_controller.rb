class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    user = user.try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to(controller: "users", action: "welcome")
    else
      redirect_to(controller: "sessions", action: "new")
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
