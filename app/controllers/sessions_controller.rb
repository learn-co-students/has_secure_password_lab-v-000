class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to 'welcome#home'
    else 
      redirect_to 'sessions#new'
    end 
  end 

  # def create
  #   user = User.find_by(name: params[:user][:name])

  #   user = user.try(:authenticate, params[:user][:password])

  #   return redirect_to(controller: 'sessions', action: 'new') unless user

  #   session[:user_id] = user.id

  #   @user = user

  #   redirect_to controller: 'welcome', action: 'home'
  # end

end
