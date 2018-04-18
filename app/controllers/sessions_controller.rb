class SessionsController < ApplicationController


  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      return head(:forbidden)
    end
  end

end
