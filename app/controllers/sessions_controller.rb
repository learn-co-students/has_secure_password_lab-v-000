class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else 
      render :new
      flash[:notice] = "incorrect username or password"
    end
  end

  def destroy
  end
end
