class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])
    return head(:forbidden) unless user.authenticate(session_params[:password])
    session[:user_id] = user.id
    redirect_to '/'
  end

  def destroy
	 session.delete :user_id
	 redirect_to '/login'
  end

  private

  # I think it's very hacky that I had to set up these params just to pass your tests....
  def session_params
    params.require(:user).permit(:name, :password)
  end

end
