class SessionsController < ApplicationController
    def new
     
    end

    def create
        if !params[:user][:password].nil? && !params[:user][:password].empty?
            @user = User.find_by(name: params[:user][:name])
            
            if !@user.nil? && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/welcome'
            else
                redirect_to login_path, alert: "Please check your account name and password."
            end
        
        else
            redirect_to login_path, alert: "Please include a password."
        
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end