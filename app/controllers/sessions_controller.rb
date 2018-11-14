class SessionsController < ActionController::Base
	def create
		@owner =  User.find_by(name: params["user"]["name"])
		if @owner && @owner.authenticate(params["user"]["password"])
			session[:user_id] = @owner.id
		else
			session[:user_id] = nil
		end
	end
end 