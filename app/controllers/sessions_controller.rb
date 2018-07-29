class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && authenticated(user)
      session[:user_id] = user.id
      redirect_to root_url
    else
      session[:user_id] = nil
      flash[:message] = "The user/password does not match our records."
      render 'new'
    end
  end

  def destroy
    if session[:user_id].nil?
      session[:user_id] = nil
    else
      session.delete :user_id
      session[:user_id] = nil
    end

    redirect_to root_url
  end

  private
    def authenticated(user)
      user.authenticate(params[:user][:password])
    end
end
