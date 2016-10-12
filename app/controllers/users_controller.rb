class UsersController < ApplicationController
  def new
  end

  def create
  	user = User.new(user_params)
  	# puts "user #{user}"
    if user.save
    	# puts "user saved"
      session[:user_id] = user.id
      redirect_to '/'
    else
    	# puts "don't match?"
      redirect_to users_new_path
    end
  end

  def welcome
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
