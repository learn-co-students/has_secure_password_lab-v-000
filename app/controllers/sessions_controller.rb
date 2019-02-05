class SessionsController < ApplicationController

  def new
  end


  def create
    if @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to 'users/homepage'
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

end
