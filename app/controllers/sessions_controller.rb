class SessionsController < ApplicationController

  def create
    @user = User.find_by(params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :welcome
  end

  def destroy
    session.delete :user
  end

end
