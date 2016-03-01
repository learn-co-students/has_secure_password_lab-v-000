class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to welcome_path
		else
			redirect_to new_user_path, alert: "authentication failed"
		end

	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end
