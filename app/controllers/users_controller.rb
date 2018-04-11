class UsersController < ApplicationController
	before_action :require_login, only: [:show]

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			redirect_to signup_path
		end
	end

	private

	def require_login
		redirect_to login_path unless session.include? :user_id
	end

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end