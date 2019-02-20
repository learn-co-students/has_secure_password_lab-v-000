class WelcomeController < ApplicationController
	def hello
		if !logged_in?
			redirect_to '/login'
		end
	end
end
