class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to controller: 'application', action: 'hello'
    else
      redirect_to controller: 'users', action: 'login'
    end

  end



  def destroy
    session.delete :user_id
    redirect_to controller: 'users', action: 'login'
  end





end
