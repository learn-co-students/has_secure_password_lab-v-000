class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:name].nil? || params[:name].blank?
      redirect_to login_path
    else
      user = User.find_by(name: params[:name])
      return redirect_to login_path unless user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end