class SessionsController < ApplicationController
  def create
    #binding.pry
    @user = User.find_by(name: login_params[:name])
    #binding.pry
    #if login_params[:password] == @user.password
    if @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      #binding.pry
      redirect_to users_path
    else
      return head(:forbidden)
    end
  end

  private

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
