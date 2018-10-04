class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to '/users/new' unless @user
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
