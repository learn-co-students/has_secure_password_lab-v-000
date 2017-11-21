class SessionsController < ActionController::Base

  def new
  	@user = User.new
  end

  def create
  	@user = User.find_by(params[:name])
  	if @user.try(:authenticate, params[:user][:password])
    	session[:user_id] = @user.id
  		redirect_to user_path(@user) 
  	else
  		redirect_to '/login'
  	end
  end
end