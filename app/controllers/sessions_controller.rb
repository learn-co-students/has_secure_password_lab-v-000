class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to "/users/#{session[:user_id]}/welcome"
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end


end
