class UsersController < ApplicationController

	def index
		require_logged_in
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to homepage_path
		else
			render :new
			flash[:notice] = "You must fill in the spots"
		end
	end

	private

	  def user_params
	    params.require(:user).permit(:name, :password, :password_confirmation)
	  end

end
