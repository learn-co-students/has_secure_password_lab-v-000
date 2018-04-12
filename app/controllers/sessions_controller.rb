class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create

		@user = User.find_by(name: params[:user][:name])
	
		if @user.authenticate(params[:user][:password])
		
			session[:user_id] = @user.id 

			redirect_to welcome_index_path
		else
			flash[:notice] = "Try again."
			redirect_to login_form_path
		end

	end 

	def destroy 
		session.delete :user_id
		flash[:notice] = "You have successfully logged out."
		redirect_to '/'
	end 
end
