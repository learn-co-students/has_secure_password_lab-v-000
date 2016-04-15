class SessionsController < ApplicationController
  def create
    @user = User.find(name: params[:name])
    return head(:forbidden) unless params[:password] == @user.password
    session[:user_id] = @user.id
  end
end
