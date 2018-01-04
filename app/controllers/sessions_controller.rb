class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to '/users/new' unless !!@user
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to '/welcome/home'
  end
end
