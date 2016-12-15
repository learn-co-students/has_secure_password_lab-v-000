class UsersController < ApplicationController

	def homepage
		# root
		@user = User.find(session[:user_id])
	end

	def new
		# signup form
		@user = User.new
	end

	def create
		# creating a new user from signup form
		@user = User.new(user_params)
		if params[:password] != params[:password_confirmation]
			redirect_to new_user_path, alert: "password mismatch"
		else
			if @user.save
				session[:user_id] = @user.id
			 	redirect_to root_path
			else
			 	render :new
			end 
		end

	end

	private

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end
end
