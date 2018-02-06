class SessionsController < ApplicationController
  
  def index
    if !!session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to new_session_path
    end
  end
  
  #get /login
  def new
    
  end
  
  #post /login
  def create
    if @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end
  
  def destroy
    if session.include? :user_id
      session.delete :name
      redirect_to new_session_path
    else
      redirect_to new_session_path
    end
  end
  
end
