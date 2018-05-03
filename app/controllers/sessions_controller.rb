class SessionsController < ApplicationController


  def new
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    #binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to 'login'
    end
  end
end
