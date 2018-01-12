class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
        session[:name] = params[:user][:name]
        session[:user_id] = @user.id
        redirect_to home_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.destroy
    redirect_to '/login'
  end

end
