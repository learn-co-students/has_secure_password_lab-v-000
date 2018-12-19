class SessionsController < ApplicationController
	def new
		@user = User.new
		render :login
	end

	def create
	  @user = User.find_by(name: params[:user][:name])
	  user = @user.try(:authenticate, params[:user][:password])
	  return redirect_to(controller: 'sessions', action: 'new') unless user
	  user = @user
	  log_in
	  render :'welcome/homepage'
	end

	def destroy
		session.delete [:user]
		redirect_to '/'
	end
end
