class SessionsController < ApplicationController
  def create
    user = User.find_by(:name => params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to('sessions#new') unless authenticated
    @user = user
    session[:user_id] = @user.id
    redirect_to 'welcome#home'
  end
end
