class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end
end
