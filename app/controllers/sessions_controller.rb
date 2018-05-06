class SessionsController < ApplicationController
    
    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:notice] = "Incorrect password"
            redirect_to '/login'
        end
    end
    
    def destroy
        session.delete :user_id
        redirect_to '/'
    end
    
end