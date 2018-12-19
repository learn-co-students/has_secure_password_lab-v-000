class SessionsController < ApplicationController

  def create
    @user = User.find_by(params[:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      redirect_to '/'
    end
  end

  def destroy
    session.delete :user
  end

end
