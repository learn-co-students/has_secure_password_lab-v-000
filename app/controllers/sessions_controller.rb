class SessionsController < ApplicationController

  def create
  	@user = User.find_by(name: session_params[:name])
  	#binding.pry
  	return head(:forbidden) unless  @user && @user.authenticate(session_params[:password])
    session[:user_id] = @user.id 
    redirect_to '/' 
  end

  private
  def session_params
  	params.require(:user).permit(:name, :password)
  end



end
