class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to login_path
    end 
  end
  
  def destroy
    session[:user_id].delete
    render 'new'
  end

  private

    def current_user
      session[:user_id]
    end

    def logged_in?
      !!current_user
    end


end