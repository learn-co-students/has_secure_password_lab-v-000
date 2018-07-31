class SessionsController < ApplicationController
  # def create
  #    @user = User.find_by(name: params[:user][:name]
  #    return head(:forbidden) unless (params[:user][:password]) == @user.password_digest
  #    session[:user_id] = @user.id
  # end


  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  end


  private



end
