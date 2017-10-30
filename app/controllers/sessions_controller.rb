class SessionsController < ApplicationController
  def new
    redirect_to '/welcome' if session[:user_id].present?
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !!@user
      return redirect_to '/login' unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      return redirect_to '/login'
    end
    redirect_to '/welcome'
  end


end
