class SessionsController < ApplicationController

	def create
		if @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to login_path
		end
	end

end