class SessionsController < ApplicationController
  def new
    #nothing to do here
  end

  def create
    @user = User.find_by(name: params[:name], password: params[:password])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to '/'
  end
end
