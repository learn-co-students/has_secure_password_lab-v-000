class SessionsController < ApplicationController
  def create
    if User.find_by(name: params[:user][:name])
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/user/new'
    end
  end
end
