class SessionsController < ApplicationController
  def create
    if @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to homepage_url
      else
        redirect_to new_user_url
      end
    else
      redirect_to new_user_url
    end
  end
end
