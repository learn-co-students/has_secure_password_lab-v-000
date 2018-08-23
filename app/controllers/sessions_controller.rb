class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: session_params[:name]).try(:authenticate, session_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to 'users/show'
    else
      redirect_to 'sessions/new'
    end
  end


  def destroy

  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
