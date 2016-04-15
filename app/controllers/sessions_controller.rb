class SessionsController < ApplicationController

  def index
  end

  def new
    @session = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])

    if authenticated
      session[:user_id] = @user.id
      redirect_to :users
    else
      redirect_to :new_session
    end
  end
end
