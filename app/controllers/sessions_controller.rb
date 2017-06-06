class SessionsController < ApplicationController
	def create
		if (user = User.find_by(name: params[:user][:name])) && params[:user][:password] != ''
			if user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to '/welcome'
			else
				redirect_to '/login', alert: 'Password error'
			end
		else
			redirect_to '/login', alert: 'User and password error'
		end
		
	end

	def destroy
		session.delete :user_id
		redirect_to '/login'
	end

end