class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
      # redirect_to controller: 'sessions', action: 'new'
    end
  end

  def destroy
    session.delete :name
  end
end
