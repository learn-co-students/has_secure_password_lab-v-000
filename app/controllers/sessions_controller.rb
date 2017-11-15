class SessionsController < ApplicationController


    def create
    #  binding.pry
      @user = User.find_by(name: params[:user][:name]).authenticate(params[:user][:password])
      if @user
        session[:user_id] = @user.id
      else
        redirect_to sessions_new_path
      end

    end





end
