class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render :new
    end
  end

  def destroy
    session.destroy [:user_id]
    redirect_to root
  end
end
