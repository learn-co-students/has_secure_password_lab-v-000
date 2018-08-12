class SessionsController < ApplicationController

  def new
    render '/users/login'
  end

  def create
    if params[:name].nil? || params[:name]==''
      redirect_to '/login'
    else
      user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to '/home'
    end
  end

  def destroy
    session.delete :user_id unless session[:user_id].nil?
    redirect_to '/login'
  end
end
