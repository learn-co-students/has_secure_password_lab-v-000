class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      redirect_to :signup
    end
  end

  def destroy
    session.delete :user
  end

end
