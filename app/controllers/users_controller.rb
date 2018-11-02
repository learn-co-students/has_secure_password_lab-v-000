class UsersController < ApplicationController
  def create
    success_ = User.create(user_params)

		if success_.id
			session[:user_id] = User.last.id 
			redirect_to '/'
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
