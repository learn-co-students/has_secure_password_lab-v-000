class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(name: session_params[:name])
  	if @user && @user.authenticate(session_params[:password])
  		session[:user_id] = @user.id
  		redirect_to user_path(@user)
  	else
  		redirect_to sessions_new_path
  	end
  end

  def destroy
  	session.clear
  end

  private

  def session_params
  	params.require(:user).permit(:name, :password)
  end
end
