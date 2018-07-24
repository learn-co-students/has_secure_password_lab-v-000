class SessionsController < ApplicationController

  def new
  end

  def create

    return redirect_to(controller: 'sessions', action: 'new') if !params[:user][:name] || params[:user][:name].empty?
@user = User.find_by(name: params[:user][:name])
return head(:forbidden) unless @user.authenticate(params[:user][:password])
session[:user_id] = @user.id
redirect_to controller: 'users', action: 'home'
  end


end
