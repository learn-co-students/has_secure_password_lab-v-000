class SessionsController < ApplicationController

  def create
    if params[:name] != ''
      session[:name] = params[:name]
    end

    if session[:name]
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    if session[:name]
      session.destroy
    end

    redirect_to login_path
  end
end
