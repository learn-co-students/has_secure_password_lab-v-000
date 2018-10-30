class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # render '/welcome/index'
      redirect_to controller: 'welcome', action: 'index'
    else
      render 'new', alert: "Password does not match"
    end
  end

  def destroy
    #raise params.inspect
    if session[:user_id].present?
      session.delete :user_id
    end
    redirect_to controller: 'sessions', action: 'new'
  end
end
