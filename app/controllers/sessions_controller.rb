class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:user][:password])
      current_user
      redirect_to welcome_path
    else
      return head(:forbidden)
    end
  end
end
