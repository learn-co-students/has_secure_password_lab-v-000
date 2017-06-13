class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !params[:user][:name].nil?
      user = User.find_by(name: params[:user][:name])
      if !user.nil?
        user.authenticate(params[:user][:password]) ? session[:user_id] = user.id : session[:user_id] = nil
      end
    end
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
  end
end
