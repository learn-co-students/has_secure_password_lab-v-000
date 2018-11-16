class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        if valid_user?
            @user = User.find_by(name: params[:user][:name])
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    private

    def current_user
        User.find(session[:user_id])
    end

    def valid_user?
        !!User.find_by(name: params[:user][:name])
    end
end
