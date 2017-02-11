class SessionsController < ApplicationController

  def login
  end

  def create
    if params[:user][:password].blank?
      redirect_to '/login'
    else
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/users/index'
      else
        redirect_to '/login'
      end
    end
  end

end
