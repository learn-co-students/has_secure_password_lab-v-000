class SessionsController < ApplicationController

  def create
    new_user = User.find_by(name: params[:user][:name])
    redirect_to new_user_path if new_user.nil?
    if new_user.authenticate(params[:user][:password])
      session[:user_id] = new_user.id

      redirect_to home_path
    else
      head(:forbidden)
    end
  end

end
