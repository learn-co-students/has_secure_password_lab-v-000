class UsersController < ApplicationController
 	def new 
 		@user = User.new
 	end
 
 	def create
 		@user = User.new(user_params)
 		if @user.save
 			session[:user_id] = @user.id
 			redirect_to users_path
 		else
 			flash[:error] = "Error Creating User, username and/or password can't be blank"
  			redirect_to new_user_path
 		end
 	end
 
 	def index
 		if session[:user_id]
 			@user = User.find_by(id: session[:user_id])
 		else
 			redirect_to new_user_path
 		end
 	end
 
 	private
 
 	def user_params
 		params.require(:user).permit(:name, :password, :password_confirmation)
 	end
 end 
