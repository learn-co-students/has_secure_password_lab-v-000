class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(name: params[:name])
		return head(:forbidden) unless @user.authenticate(params[:password])
		session[:user_id] = @user.id
	end

	# def create 
	# 	if !params[:username] || params[:username].empty?
	# 		redirect_to TRY AGAIN
	# 	else
	# 		session[:username] = params[:username]
	# 		redirect_to LOGIN
	# 	end 
	# end 

	def destroy 
		reset_session #or sesssion.delete? 
		flash[:notice] = "You have successfully logged out."
		redirect_to root_url 
	end 
end
