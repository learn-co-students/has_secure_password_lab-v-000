class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      # return head(:forbidden) unless @user.authenticate(params[:user][:password])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to homepage_path
      else
        flash[:notice] = "Invalid password"
        redirect_to new_session_path
      end
    else
      redirect_to new_session_path
    end
  end
end
