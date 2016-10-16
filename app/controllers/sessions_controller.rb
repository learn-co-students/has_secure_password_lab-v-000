class SessionsController < ApplicationController
  def new
  end

  def create
    unless params[:name].nil? || params[:password].nil? || params[:password_confirmation].nil?
      user = User.find_by(name: params[:name])
      session[:user_id] = user.id
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end
end
