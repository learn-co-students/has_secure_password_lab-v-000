class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    else
      render :new
    end
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render :'users/welcome'
    else
      redirect_to signup_path
    end
  end

  def destroy
    session.delete :user_id

    redirect_to login_path
  end

end
