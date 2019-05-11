class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user] = @user
    end

    def destroy
        if session[:user]
            session.delete :user
        end
    end
end