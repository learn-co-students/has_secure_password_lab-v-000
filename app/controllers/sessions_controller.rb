class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end
end
