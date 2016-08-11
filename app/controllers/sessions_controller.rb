class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    return redirect_to login_path unless user
    session[:user_id] = user.id
    @user = user
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
