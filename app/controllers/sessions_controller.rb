require 'pry'

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end
end
