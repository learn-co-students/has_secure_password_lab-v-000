class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name]) # find a user
    binding.pry
    @user = user.try(:authenticate, params[:user][:password]) # try to authenticate, if true set instance variable
    return redirect_to(controller: 'sessions', action: 'new') unless @user # if @user is not valid, redirect to the login page
    session[:user_id] = @user.id # set the user_id key of the session hash to @user's id
    redirect_to controller: 'welcome', action: 'index' # send them to the welcome page
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
