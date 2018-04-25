class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user] && params[:user][:name]
      @user = User.find_by(name: params[:user][:name])
      if params[:user][:password] && @user.authenticate(params[:user][:password])
        log_user_in
      end
    end
    redirect_to show_path
  end

end
