class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.nil?
            redirect_to login_path
            flash[:notice] = "Unable to find your username. Try again or sign up."
        else
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/'
            else
                redirect_to login_path
                flash[:notice] = "Incorrect Password"
            end
        end
    end
end
