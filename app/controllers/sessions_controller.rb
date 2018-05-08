class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to homepage_path
        else
            render :new, alert: "Password doesn't match!"
        end
    end
    def destroy
        if sessio[:user_id].present?
            session.destroy :user_id            
        end
        redirect_to "/"
    end
end
