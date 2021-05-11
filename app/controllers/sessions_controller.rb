class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    if user_params[:password] == nil || user_params[:password].empty?
      redirect_to '/login'
    else
      @user = User.find_by(name: user_params[:name])
      if @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to '/welcome'
      else
        redirect_to '/login'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
