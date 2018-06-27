class SessionsController < ApplicationController
  def create

    @user = User.find_by(name: params[:user][:name])
    
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/users/login" 
    end
  end
end