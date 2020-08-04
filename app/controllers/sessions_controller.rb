class SessionsController < ApplicationController
  def new
    #nothing to do here
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render '/login'
  end


end
