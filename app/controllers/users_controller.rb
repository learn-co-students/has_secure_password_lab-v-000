class UsersController < ApplicationController 
  def new
  	@user=User.new
  end

  def create

  	if valid_signup_info?
  		new_user=User.create(user_params)
	  	session[:user_id]=new_user.id
	  	redirect_to '/' 
	else
		redirect_to '/users/new' 
	end
  end

  private
  	def valid_signup_info?
  		signup = params[:user]
  		valid_name = (signup[:name] && signup[:name]!='')
  		valid_password = signup[:password] && signup[:password]==signup[:password_confirmation] && signup[:password]!=''
  		valid_password && valid_name
  	end
  	def user_params
  		params.require(:user).permit(:name, :password)
  	end
end

