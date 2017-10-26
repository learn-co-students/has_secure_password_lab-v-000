class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(name: params[:name])
		return head(:forbidden) unless @user.authenticate
		session[:user_id] = @user.id
	end

	def destroy
		session.delete :user_id
		redirect_to '/'
	end
end
