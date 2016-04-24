class SessionsController < ApplicationController
  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      redirect_to users_new_path, flash: {alert: "that doesn't match our records"}
    end
  end

  def destroy

  end

end
