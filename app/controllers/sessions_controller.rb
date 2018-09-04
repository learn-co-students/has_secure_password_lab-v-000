class SessionsController < ApplicationController

  def create
    session[:user_id] = params[:id]
    redirect_to user_path(params[:id])
  end

end
