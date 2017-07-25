class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.authenticate(params[:user][:password])
    return redirect_to('/signup') unless @user
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
