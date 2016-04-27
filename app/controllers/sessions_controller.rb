class SessionsController < ApplicationController
  
  def new
    #sets @user to build around from before_action #current_user
    #renders sessions/new.html.erb
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to login_path unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
