class SessionsController < ApplicationController
    def new
    end

    def create 
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path 
    end 

    def destroy
        @user = User.find_by(params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session.delete :username
    end 
end
