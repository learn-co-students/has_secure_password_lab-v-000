class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
	end

	def create
		redirect_to new_user_path and return unless params[:user][:password] == params[:user][:password_confirmation]
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			redirect_to new_user_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password)
	end
end
