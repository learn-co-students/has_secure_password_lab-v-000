class SessionsController < ApplicationController

    def new
    end
    
    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            log_in(user)
            redirect_to '/home'
        else
            flash.now[:error] = 'Invalid email/password combination'
            redirect_to '/login'
        end
    end
end
