class SessionsController < ApplicationController

  def new
  end

  def create
    #logs in with correct password
    #rejects invalid passwords
    #rejects empty passwords
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

end
