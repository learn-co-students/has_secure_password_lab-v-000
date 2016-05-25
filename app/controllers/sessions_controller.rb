class SessionsController < ApplicationController

  def new

  end

  def create
    #binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
     redirect_to new_user_path
    end
#    session[:name] = params[:name]
  #  binding.pry
#    session[:name].blank? ? redirect_to(sessions_new_path) : redirect_to(root_path)
  end

  def destroy
    session.delete  :name
    redirect_to root_path
  end
end
