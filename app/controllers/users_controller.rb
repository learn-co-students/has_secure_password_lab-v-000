class UsersController < ApplicationController

def new
end

def create
	if params[:user][:password] != params[:user][:password_confirmation]
		redirect_to '/signup'
	else
	@user = User.create(user_params)
	session[:user_id] = @user.id
	redirect_to "/home"
end
end

def home
	if session[:user_id] == nil || session[:user_id] == ""
		redirect_to '/login' 
	else
	@user = User.find(session[:user_id])
	end
end

private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
