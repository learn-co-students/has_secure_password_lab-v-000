require 'pry'
class SessionsController < ApplicationController
   
    def new
    end

    def create
        # binding.pry
        @user = User.find_by(name: params[:user][:name])
        authenticated = @user.try(:authenticate, params[:user][:password])
        if authenticated
           session[:user_id] = @user.id
           redirect_to '/'
        else   
          redirect_to '/login'
        end
    end
end