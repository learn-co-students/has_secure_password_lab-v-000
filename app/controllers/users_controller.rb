class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.name = params[:user][:name]
		@user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]
		if @user.save && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_to new_user_path
		end
	end
end
