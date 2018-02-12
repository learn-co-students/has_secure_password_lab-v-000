class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:notice] = "incorrect Login Information..."
      render :login
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end
