require 'pry'

class UsersController < ApplicationController

  def new
  end

  def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
      if @user.save    # params[:user][:password] && !params[:user][:password_confirmation].empty
      params[:user][:password] == params[:user][:password_confirmation]
       redirect_to "/"
      else
        redirect_to "/users/new"
      end
    end

 private
   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end

 end
