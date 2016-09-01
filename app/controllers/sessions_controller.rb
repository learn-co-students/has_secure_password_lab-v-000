class SessionsController < ApplicationController
  def create
    if params[:user][:password].empty?
      redirect_to login_path
    else
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end
  end
end
