class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name]) #find the user
    #
    user = user.try(:authenticate, params[:user][:password]) #try to auth user
    #
    return redirect_to(controller: 'sessions', action: 'new') unless user
    #redirect to new if user does not exist
    #
    session[:user_id] = user.id ##otheriwse log in user / set session id
    #
    @user = user #set user instance to can use in redirect

    redirect_to controller: 'welcome', action: 'home' #redirect to welcome page
  end
end
