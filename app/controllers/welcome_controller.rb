class WelcomeController < ApplicationController

	def index

		if !logged_in?
			redirect_to '/login'
		end
		
	end

end
