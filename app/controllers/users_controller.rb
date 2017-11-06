class UsersController < ApplicationController

before_action :validate_password_confirmation, only: :create

def new
end

def create
	user = User.new(user_params)
	if user.save
     	session[:user_id] = user.id
     	redirect_to '/'
  	else
    	redirect_to '/signup'
   	end
end

def homepage
   @user = User.find_by(name: params[:name])
end

def index
end

private
 
def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
end

def validate_password_confirmation
   if params[:user][:password] != params[:user][:password_confirmation]
     redirect_to '/signup'
   end
end

end