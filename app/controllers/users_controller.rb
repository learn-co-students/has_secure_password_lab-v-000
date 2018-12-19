class UsersController < ApplicationController
	#before_action :require_logged_in #unless signup

	def new
		@user = User.new
		render :signup
	end

	def create
		@user = User.create(user_params)
		if @user.save
			log_in
			render :'welcome/homepage'
		else
			redirect_to controller: 'users', action: 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end

#Create a Users controller. It should respond to new with the signup form, and respond to create by creating a new user.
