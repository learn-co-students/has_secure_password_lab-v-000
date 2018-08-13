class SessionsController < ApplicationController

    def new 
      if !logged_in?
        render '/sessions/new'
      else 
        redirect_to '/'
      end     
    end 
    
    def create  
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to "/"
        else
            flash[:notice] = "Incorrect login information"
            redirect_to "/"
        end         
    end     
end