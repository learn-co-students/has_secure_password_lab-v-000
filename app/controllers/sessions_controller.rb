class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    password = params[:user][:password]
    if !params[:user][:password].empty? && params[:user][:password].instance_of?(String)
      if @user.authenticate(password)
        session[:user_id] = @user.id
      end
    else
      redirect_to new_user_path
    end
  end
end
