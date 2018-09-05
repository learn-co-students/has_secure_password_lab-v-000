class SessionsController < ApplicationController

    # login form
    def new
    end

    # log the user in
    def create
        @user = User.find_by(username: params[:user][:username])
        return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        
        redirect_to new_user_path
    end

    def destroy
        reset_session
        redirect_to login_path
    end
end
