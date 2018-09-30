class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      login!
      redirect_to '/'
    else
      flash[:notice] = "Bad credentials, please try again!"
      redirect_to '/login'
    end
  end


  def destroy
    session.clear
    redirect_to '/login'
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

end
