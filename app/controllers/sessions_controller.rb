class SessionsController < ApplicationController
    def create
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      if user
    
        @user = user 
        session[:user_id] = @user.id 
        redirect_to controller: 'welcome', action: 'index'        
      else 
        redirect_to controller: 'sessions', action: 'new'
      end
    end


    


    def destroy
      session.delete :user_id
      redirect_to '/'
    end 
  end