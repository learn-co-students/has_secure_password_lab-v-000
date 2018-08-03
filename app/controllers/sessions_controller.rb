class SessionsController < ApplicationController
  def new
  end

  def create
    if !params[:name].present?
      redirect_to login_path
    else
      session[:name] = params[:name]
      redirect_to homepage_path
    end
  end

  def destroy
    session.delete :name
    redirect_to '/'
  end

end
