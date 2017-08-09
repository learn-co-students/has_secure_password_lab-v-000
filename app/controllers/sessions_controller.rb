class SessionsController < ApplicationController
	skip_before_action :require_logged_in, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			@user = user
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/sessions/new'
		end
	end

	def destroy
		reset_session
		redirect_to '/sessions/new'
	end

	



end
