class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user = @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to sessions_path
    else
      redirect_to new_sessions_path
    end
  end
end
