class SessionsController < ApplicationController
  def new
    #nothing to do here
    @user = User.new
  end

  def create
      @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/homepage'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to "/login"
  end

end
