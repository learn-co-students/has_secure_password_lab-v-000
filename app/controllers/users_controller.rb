class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	if params[:user][:password] == params[:user][:password_confirmation]
  		@user = User.new(user_params)
  		# binding.pry
	  	if @user.save
	  		session[:user_id] = @user.id
	  		redirect_to root_path
	  	else
	  		render 'users/new'
	  	end
	  else
	  	# binding.pry
	  	redirect_to '/users/new'
	  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
