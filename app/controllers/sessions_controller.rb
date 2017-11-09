class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    if @user.password == @user.password_confirmation && !@user.password.empty?
      redirect_to '/home'
    else
      session[:user_id] = nil
      redirect_to '/' #just to get rid of 'template missing' error
    end
  end

end
