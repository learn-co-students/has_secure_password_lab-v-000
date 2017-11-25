class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user && @user.try(:authenticate, user_params[:password_confirmation])
    
  		@user.save
  		session[:user_id] = @user.id
  		redirect_to '/welcome'
  	else
  		flash[:alert] = 'Password not valid'
  		redirect_to '/users/new'
  	end
  end
end
