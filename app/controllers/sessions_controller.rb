class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.find_by(name: params[:name])
      @user = User.find_by(name: params[:name])
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_session_path
      end
    else
      redirect_to new_session_path
    end
  end

end
