require 'pry'
class SessionsController < ApplicationController

  def create
    # binding.pry
    if User.find_by(name: params[:user][:name])
      @user = User.find_by(name: params[:user][:name])

      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
      else
        redirect_to new_session_path
      end
    else
      redirect_to new_session_path
    end
  end
end
