class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        @user = user.try(:authenticate, params[:user][:password])

        if !@user
            redirect_to '/sessions/new'
        else
            session[:user_id] = @user.id
        end


    end

    def destroy
        session.delete :name
    end
    
end
