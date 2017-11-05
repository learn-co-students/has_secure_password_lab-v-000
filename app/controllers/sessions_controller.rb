class SessionsController < ApplicationController
	
	def new
		@user = User.new		
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		if user = @user.try(:authenticate, params[:user][:password])
			session[:user_id] = @user.id
			redirect_to '/'
		else	
			render :new
		end		
	end

	def destroy		
		session.delete :user_id		
		redirect_to login_path
	end

end
