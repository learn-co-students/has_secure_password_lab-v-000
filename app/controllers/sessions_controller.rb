class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise.params.inspect
    user = User.find_by(name: params[:name])
    return head(:forbidden) unless user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path
  end

end
