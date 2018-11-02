class WelcomeController < ApplicationController
	def index
		#return head(:forbidden) unless @user.authenticate(params[:user][:password])
		@user = User.find_by(id: session[:user_id])
	end
end
