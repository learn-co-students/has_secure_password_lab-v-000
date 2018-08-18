class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:name] && params[:name] != ''
      user = User.find_by(name: params[:name])
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        @user = user
        redirect_to '/welcome/home'
      else
        redirect_to '/login'
      end
    else
      redirect_to '/login'
    end

  end

  def destroy
    @user = User.find_by(name: params[:name])
    session.delete :@user.id
    redirect_to '/login'
  end

end
