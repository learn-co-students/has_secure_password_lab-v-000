class SessionsController < ApplicationController
	def create
		@user = User.find_by(name: params[:user][:name]) #find the user
		return head(:forbidden) unless @user.authenticate(params[:user][:password]) #authenticate user password
		session[:user_id] = @user.id #set user id if user & password match in sessions.
	end
end