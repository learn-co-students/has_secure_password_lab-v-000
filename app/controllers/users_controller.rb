class UsersController < ApplicationController

	def index
		@user = User.find(current_user.id)
	end

	def create
		if params[:user][:password] == params[:user][:password_confirmation]
    		user = User.create(user_params)
    		session[:user_id] = user.id
    	else
    		redirect_to new_user_path
    	end
  	end

	private
 
	  def user_params
	    params.require(:user).permit(:name, :password, :password_confirmation)
	  end


end
