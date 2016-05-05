class SessionsController < ApplicationController
	def new
		@user = User.new
		render :login
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		render './users/welcome'
	end

	def logout
		session.clear
		redirect_to '/login'
	end
end