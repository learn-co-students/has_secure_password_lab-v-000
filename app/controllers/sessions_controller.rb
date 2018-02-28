class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])

    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to 'welcome/home' #controller: 'welcome', action: 'home' is another way to do the same thing.
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end
