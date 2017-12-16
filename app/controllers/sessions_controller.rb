class SessionsController < ApplicationController


  def new #carrying the user name
    if current_user
      redirect_to home_path(current_user)
    end
  end

  def create #creates a new session (aka logs the user in if not already logged in)
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path(@user)
    else
      flash[:alert] = "Please enter a valid password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end

end
