class UsersController < ApplicationController
	def create
		@user = User.new
		@user.name = params["user"]["name"]
		@user.password = params["user"]["password"]
		x = true
		if params["user"]["password"] != params["user"]["password_confirmation"]
			x = false
		end
 		if (@user.valid?) && (x == true)
			@user.save
			session[:user_id] = @user.id
			redirect_to "/users/welcome"
		else
			redirect_to "/users/new"
		end
	end
 	def index
	end
 	def welcome
	end
end 