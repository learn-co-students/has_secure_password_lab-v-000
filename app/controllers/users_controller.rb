class UsersController < ApplicationController
	before_action :require_logged_in
	skip_before_action :require_logged_in, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/users/new'
		end
	end

	def show
		@user = User.find_by(id: params[:id])
  end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end
