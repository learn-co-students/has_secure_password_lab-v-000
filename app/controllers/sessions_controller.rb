class SessionsController < ApplicationController
  
  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless session[:user_id]
    session[:user_id] = @user.id
  end
end
