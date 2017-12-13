require 'pry'

class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
        #binding.pry
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            redirect_to action: 'new'
        end
    end
    
    def destroy
        if session.include? :user_id
            session[:user_id] = nil
        end
    end
    
end