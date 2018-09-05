class SessionsController < ApplicationController

  def new
  end

  def show

  end

  def create
     @user = User.find_by(name: params[:user][:name])
     return redirect_to '/login' unless @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end

end
