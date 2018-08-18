class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:name] && params[:user][:name] != ''
      user = User.find_by(name: params[:user][:name])
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
    session.delete :user_id
    redirect_to '/login'
  end

end
