class SessionsController < ApplicationController

    def new
        render :login
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to 'sessions/new'
        end
    end

end
