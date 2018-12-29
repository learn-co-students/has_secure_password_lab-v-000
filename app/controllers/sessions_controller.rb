class SessionsController < ApplicationController

  def new
  end

  def create
    if  params[:user][:password] == nil || params[:user][:password].empty?
      flash[:notice] = "Please fill in all information to login."
      redirect_to controller: 'sessions', action: 'new'
    else
      @user = User.find_by(name: params[:user][:name])
      @user = @user.try(:authenticate, params[:user][:password])
      if @user
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'index'
      else
        flash[:notice] = "The password for this user is incorrect."
        redirect_to controller: 'sessions', action: 'new'
      end
    end
  end

end