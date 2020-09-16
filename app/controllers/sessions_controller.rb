class SessionsController < ApplicationController
  def new
    #nothing to do here
  end

  def create
    user = User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])

    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to '/login'
  end

  def destroy
    session[:user_id].delete
    redirect_to '/'
  end

end
