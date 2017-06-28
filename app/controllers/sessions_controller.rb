class SessionsController < ApplicationController
	def new	
	end


	def create
		if session[:user_id].nil?
			user = User.find_by(name: params[:user][:name])
			user = user.try(:authenticate, params[:user][:password])
			return redirect_to login_path unless user
			session[:user_id] = user.id
			redirect_to homepage_path
		else
			redirect_to homepage_path
		end
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end
end