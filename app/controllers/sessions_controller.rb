class SessionsController < ApplicationController
  def login
  	@user = User.new
  end



  def create
  	@user = User.find_by(name: user_params[:name])

  	if @user && @user.try(:authenticate, user_params[:password])
  		
  		session[:user_id] = @user.id
  		redirect_to '/welcome'
  	else
  		flash[:alert] = 'Password not valid'
  		redirect_to '/login'
  	end
  end

  def logout
  end


end
