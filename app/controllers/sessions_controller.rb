class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to home_path
  end
  
  def destroy
    session[:user_id].delete
    redirect_to login_path
  end

  private

    def current_user
      session[:user_id]
    end

    def logged_in?
      !!current_user
    end


end