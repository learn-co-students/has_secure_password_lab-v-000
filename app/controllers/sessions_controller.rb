class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user
      return head(:forbidden) unless @user.authenticate(user_params[:password])
      current_user(@user)
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

end
