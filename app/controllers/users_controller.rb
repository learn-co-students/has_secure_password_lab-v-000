class UsersController < ApplicationController

	def new

	end

	def create
    @user = User.new(name: params[:user][:name],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
    redirect_to(controller: 'users', action: 'new') if params[:user][:password_confirmation] != params[:user][:password]
    @user.save
    session[:user_id] = @user.id
	end

	private

	def new_user
		User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
	end
end
