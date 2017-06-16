class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session.delete :user_id if logged_in
    redirect_to root_path
  end
end
