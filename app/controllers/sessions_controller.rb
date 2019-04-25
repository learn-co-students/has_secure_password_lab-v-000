class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  def create
    #byebug
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      redirect_to 'users/homepage'
    else
      redirect_to '/login'
    end
  end
end
