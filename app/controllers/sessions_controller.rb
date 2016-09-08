class SessionsController < ApplicationController

  def create #create session by login
    #raise params.inspect
     user = User.find_by(name: params[:user][:name])
     if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to controller: 'welcome', action: 'show'
    else
      redirect_to controller: 'sessions', action: 'new'
    end 
  end

  def new 
  end


  def destroy
    current_user = session[:user_id] = nil
    redirect_to controller: 'sessions', action: 'new'
  end


end
