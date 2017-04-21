class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    if authenticated
      @user = user
      session[:user_id] = @user.id
      redirect_to welcome_index_path
    else
      flash[:notice] = "Invalid login credentials"
      redirect_to sessions_new_path
    end
  end

  def destroy
  end


end
