class SessionsController < ApplicationController

  def new
    if !!current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      login @user
      flash[:success] = 'Welcome Back!'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end
