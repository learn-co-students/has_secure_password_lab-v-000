class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      return redirect_to login_path
    end
    redirect_to root_path
  end

  def destroy
  end
end
