class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: params[:user][:name])
    #binding.pry
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
  end

  def current_user
    session[:user_id]
  end
end
