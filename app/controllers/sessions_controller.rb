class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to users_path(@user)
      else
        redirect_to login_path
      end
    end

  def destroy
    session.delete :name
    redirect_to '/'
  end

end
