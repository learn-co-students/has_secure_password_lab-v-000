class SessionsController < ApplicationController

  def new

  end

  def create

    @user = User.find_by_name(params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.delete :name
    redirect_to '/login'
  end
end
