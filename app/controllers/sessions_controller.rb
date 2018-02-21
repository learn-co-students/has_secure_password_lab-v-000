class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to '/'
    else
      redirect_to sessions_login_path
    end
  end

  def destroy
    session.delete :name
    redirect_to new_user_path
  end

end
