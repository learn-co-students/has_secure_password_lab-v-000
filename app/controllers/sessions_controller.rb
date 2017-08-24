class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
   if  @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  def destroy
    if session[:name]
      session.delete :name
    end
    redirect_to '/'
  end
end
