class SessionsController < ApplicationController

  def new
  end

  def create
    if User.find_by(name: params[:user][:name])
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        return head(:forbidden)
        redirect_to '/login'
      end
    else
      redirect_to '/login'
    end
  end

end
