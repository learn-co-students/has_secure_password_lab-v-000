class SessionsController < ApplicationController

  def new
    render :login
  end

  def create
    # raise params.inspect
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/welcome"
    else
      redirect_to :root
    end
  end

end
