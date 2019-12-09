require 'pry'
class SessionsController < ApplicationController
    def new
    end
    

    def create
        #binding.pry
        #always remember to check rails s 
      #@user = User.find_by(name: params[:name]) didn't work according to pry
      @user = User.find_by(name: params[:user][:name]) 
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      #@user = User.find_by(name: params[:name]) return head(:forbidden) unless @user.authenticate(params[:password])
      #return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
    end

    def destroy
    end

end