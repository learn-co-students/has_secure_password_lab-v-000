class WelcomeController < ApplicationController
	
	def welcome
		@user = User.find_by(id: session[:user_id])
	end

end
