class UsersController < ApplicationController 

	def new 
		
	end 
	def create 
		@user = params[:user] 
		@password = @user[:password]
		@name = @user[:name] 
		@password_confirmation = @user[:password]
		
		if User.create!(name: @name, password: @password, password_confirmation: @password_confirmation )
			session[:user_id] = User.last.id

			redirect_to "/create_account"
		else 
			
		end 	

		
	end 
end 
