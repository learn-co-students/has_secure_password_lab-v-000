class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user
            return head(:forbidden) unless @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id
            redirect_to '/'
        else 
            redirect_to 'sessions/new'
        end 
    end 
end
