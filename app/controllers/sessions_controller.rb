class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:session][:name])
    user = user.try(:authenticate, params[:session][:password])
    redirect_to login_path unless user
    session[:user_id] = user.id
    redirect_to user

    ## Working solution using helpers in SessionsHelper module
    # user = User.find_by(name: params[:session][:name])
    # if user && user.authenticate(params[:session][:password])
    #   log_in user
    #   redirect_to user
    # else
    #   flash[:notice] = "Looks like you don't have an account yet. Sign up now!"
    #   redirect_to login_path
    # end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end
end
