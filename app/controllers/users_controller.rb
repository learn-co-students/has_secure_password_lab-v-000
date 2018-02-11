class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to :new_user
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(user_params)
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end
