class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      login
      redirect_to @user
    else
      flash[:message] = "Invalid name/password combination"
      redirect_to '/login'
    end

  end
end
