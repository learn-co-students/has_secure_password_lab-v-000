class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(params[:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
    end
  end

  def destroy
  end

end
