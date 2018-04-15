class UsersController < ApplicationController

    def new
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation]) 
         if !params[:name] || params[:name].empty? || params[:password] != params[:password_confirmation]
       redirect_to '/users/new'
   else
            @user.save
            redirect_to '/welcome/welcome'
        end
    end
    
    private
    def login
        return head(:forbidden) unless session[:user_id]
    end
end
