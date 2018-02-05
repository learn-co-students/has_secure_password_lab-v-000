class SessionsController < ApplicationController

  def new
  end

  def create
    if !params[:user][:name] || params[:user][:name].blank? || params[:user][:name] == nil
      redirect_to login_path
    else
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end
  end

end
