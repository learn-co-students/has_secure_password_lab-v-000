class SessionsController < ApplicationController

  def new
  end

  def create
    # @user = User.find_by(name: params[:user][:name])
    # return head(:forbidden) unless @user.authenticate(params[:user][:password])
    # session[:user_id] = @user.id
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Please try again."
      render :new     
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


end
