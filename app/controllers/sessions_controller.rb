class SessionsController < ApplicationController

	def create
		user = User.find_by(name: params[:user][:name])
		if user && user.authenticate(params[:user][:password])
    	session[:user_id] = user.id
    	redirect_to welcome_path
    else
    	redirect_to login_path, alert: "Incorrect username or password"
    end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, alert: 'Successfully logged out'
	end
end
