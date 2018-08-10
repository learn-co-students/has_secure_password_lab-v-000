class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:name] && params[:password] == current_user.password_digest
      session[:user_id] = current_user.id

      render 'users#show'
    else

      redirect_to login_path
    end
  end
end
