class SessionsController < ApplicationController

  def create

    user = User.find_by(:name => user_params[:name])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = 'Incorrect username/password combination'
      redirect_to root_path
    end
  end


  def user_params
    params.require(:user)
  end
end
