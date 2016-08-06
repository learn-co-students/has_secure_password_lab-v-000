class SessionsController < ApplicationController

  def new
  end

  def create
    #raise params.inspect
    user = User.find_by(name: params[:user][:name])

    if !user.nil?
      return redirect_to login_path unless user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end

  end  

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end