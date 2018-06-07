class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to '/welcome'
		end
	end

	def create
		user = User.find_by(name: params[:user][:name])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			
		else
			redirect_to '/login'
		end
	end

	def destroy
		session.clear
		redirect_to '/login'
	end


end
