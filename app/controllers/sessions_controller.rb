class SessionsController < ApplicationController
  def new
    if !current_user.nil?
      redirect_to '/welcome'
    end
  end

  def create
    user = User.find_by(name: params[:name])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

end
