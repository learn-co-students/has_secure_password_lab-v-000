class SessionsController < ApplicationController
  
  def new
  end

  def create
    user=User.find_by(params[:username])
    if user && user.authenticate(params[:password])
      login(user.id)
      current_user


  end

  def destroy
    session.delete[:user_id]
  end
end
