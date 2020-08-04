class SessionsController < ApplicationController
  def new
    #nothing to do here
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/homepage'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
