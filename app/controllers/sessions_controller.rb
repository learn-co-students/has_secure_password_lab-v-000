class SessionsController < ApplicationController

  def new
  end

#  def create
#    @user = User.find_by(name: params[:name])
#    if !!@user.authenticate(params[:password])
#      session[:user_id] = @user.id
#      redirect_to '/home'
#    else
#      redirect_to '/login'
#    end
#  end


  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'users', action: 'home'
  end

  def destroy
    session.delete :user_id
    flash[:notice] = "You have logged out"
    redirect_to '/'
  end

end
