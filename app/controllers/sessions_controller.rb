class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    if !params[:user_id].nil?
      session.delete(:user_id)
    end
    redirect_to login_path
  end
end
