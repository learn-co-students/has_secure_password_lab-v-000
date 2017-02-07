class SessionsController < ApplicationController

	def index
		render 'homepage'
	end

	def new
	end

	def create
		@user = User.find_by(:name => params[:user][:name])
		return head(:forbidden) unless @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect_to action: 'index'
	end

end