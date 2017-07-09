class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(name: params[:user][:name])
      if  user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to users_path
      else
        redirect_to new_session_path
      end
    end

    def show
    end

    def edit
    end

    def update
    end

    def index
    end

    def destroy
      if session[:name].present?
        session.clear
      end
      redirect_to new_session_path
  	end

end
