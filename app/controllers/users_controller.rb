
class UsersController < ApplicationController
	
	def create
		@user = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to users_path
		else
			redirect_to new_user_path
		end
	end

	def new
	end

	private
	
	 	def user_params
	 		params.require(:user).permit(:name, :password, :password_confirmation)
 		end
	
end