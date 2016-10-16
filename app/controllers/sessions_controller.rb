class SessionsController < ApplicationController
  def new
  end
  #
  # def create
  #   user = User.find_by(name: params[:name], password: params[:password])
  #   unless params[:password].nil?
  #     flash[:notice]= "wrong password" unless user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to controller: 'users', action: 'index'
  #   else
  #     redirect_to controller: 'sessions', action: 'new'
  #   end
  # end
  def create
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to controller: 'users', action: 'index'
    else
      flash[:notice]= "wrong password"
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def delete
    session.destroy
    redirect_to '/'
  end
end
