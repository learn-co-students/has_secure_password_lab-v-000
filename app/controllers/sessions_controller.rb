class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to users_home_path
    else
      @user = User.new
    end
  end

  def create
    if logged_in?
      redirect_to users_home_path
    else
      if @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to users_home_path
        else
          redirect_to login_path
        end
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    if logged_in?
      session.delete :user_id
      redirect_to login_path
    else
      redirect_to login_path
    end
  end
end
