class SessionsController < ApplicationController

	def create
		#raise params.inspect
		@user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect_to @user
	end

end
