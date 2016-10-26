class SessionsController < ApplicationController
	def create
		@user = User.find_by(name_params)
		return head(:forbidden) unless @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect_to home_path
	end

	def session_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end

	def name_params
		params.require(:user).permit(:name)
	end
end
