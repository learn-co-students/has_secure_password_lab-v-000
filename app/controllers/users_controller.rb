class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create #doesn't check if username is blank or taken
		if params[:user][:password] != '' && params[:user][:password] == params[:user][:password_confirmation]
			user = User.create(user_params)
			session[:user_id] = user.id
			redirect_to '/welcome'
		else
			redirect_to '/signup', alert: 'error'
		end
	end

	def welcome
		@user = User.find(session[:user_id])
	end

	def login
		@user = User.new
	end

	private

	def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
