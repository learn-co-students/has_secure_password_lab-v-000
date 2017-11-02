class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(name: params[:name])
 
  	if @user.authenticate(params[:password])
	  	session[:user_id] = @user.id
	  	redirect_to new_welcome_path
	 else
	 	flash[:error] = "wrong username or password"
	 	redirect_to new_session_path
  	end
  end
end
