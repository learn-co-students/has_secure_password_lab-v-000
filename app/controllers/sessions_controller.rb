class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end

end
