require 'pry'

class UsersController < ApplicationController

  def new
  end

  def create
      @user = User.create(user_params)
      session[:user_id] = @user.id

      if params[:password] && !params[:name].empty?
        params[:password] == params[:password_confirmation]
        @user.password = params[:password]

      else
        redirect_to "/users/new"
      end

 end


  #    if session[:user_id] = @user.id
  #      user_is_valid
  #    else


 private
   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation, :password_digest)
   end

   def user_is_valid
     if params[:password] && params[:name].empty?
       params[:password] = params[:password_confirmation]
       @password = params[:password]
     end
   end



 end
