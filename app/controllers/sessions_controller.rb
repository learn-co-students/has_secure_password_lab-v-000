class SessionsController < ApplicationController
  helper_method :current_user


  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    current_user
    redirect_to '/'
  end


end
