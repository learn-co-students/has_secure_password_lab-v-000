class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:user][:password] && !params[:user][:password].empty?
            @user = User.find_by(name: params[:user][:name])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/show'
            end
        else
            redirect_to '/new'
        end
    end
end