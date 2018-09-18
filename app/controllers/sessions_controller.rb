class SessionsController < ApplicationController
  def login
    if session[:user_id].blank?
      render :login
    else
      redirect_to "welcome/show"
    end
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to "welcome/show"
  end
end
