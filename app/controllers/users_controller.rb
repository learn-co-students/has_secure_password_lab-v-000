class UsersController < ApplicationController
	def new
	end

	def create
		
#     @user = User.create(user_params)
#     if @user
#     redirect_to '/users/show'
# else
# 	redirect_to '/users/new'
if params[:user][:password] == params[:user][:password_confirmation]
	User.create(user_params)
	session[:user_id] = User.last.id
	redirect_to '/users/show'
else
	redirect_to '/users/new'
end
  end

  def show

  	# @user = User.find_by(name: params[:user][:name])
   #  return head(:forbidden) unless @user.authenticate(params[:user][:password])
  end
   private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
