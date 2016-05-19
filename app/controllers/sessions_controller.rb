class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      head(:forbidden)
    end
  end

end
