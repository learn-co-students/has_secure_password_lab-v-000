class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.nil? 
      redirect_to controller: 'sessions', action: 'new'
    elsif @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end