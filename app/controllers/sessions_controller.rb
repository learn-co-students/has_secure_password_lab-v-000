class SessionsController < ApplicationController
    
    def new
    end

    def create
        user = User.find_by(name: user_params[:name])
        if user && auth_pass(user)
            session[:user_id] = user.id
            redirect_to users_path
        else
            redirect_to new_session_path
        end

    end

    def destroy
    end

end