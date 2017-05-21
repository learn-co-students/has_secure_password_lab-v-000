
class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.password == @user.password_confirmation
			if @user.save
				session[:user_id] = @user.id
				render '/sessions/new'
			else
				render :new
			end
		else
			redirect_to '/users/new'
		end						
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end

end