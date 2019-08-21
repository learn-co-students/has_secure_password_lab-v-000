class SessionsController < ApplicationController

    def create
        if @user = User.find_by(name: params[:user][:name])
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            return head(:forbidden)
        end
    end


end