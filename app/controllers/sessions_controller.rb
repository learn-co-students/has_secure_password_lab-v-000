class SessionsController < ApplicationController

    def new 
    end

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            redirect_to new_welcome_path
        else 
            flash[:notice] = "Login in incorrect"
            redirect_to new_session_path
        end
    end 

    def destroy
        sessions.delete[:user_id]
        redirect_to new_session_path
    end
end