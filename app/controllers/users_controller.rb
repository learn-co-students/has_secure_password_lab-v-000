class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome!"
			redirect_to @user
		else
			redirect_to '/users/new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end
