class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    if @user
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'index'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

end
