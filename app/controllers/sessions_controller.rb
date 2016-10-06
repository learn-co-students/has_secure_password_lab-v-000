class SessionsController < ApplicationController
  def new
    if !current_user.nil?
      redirect_to '/welcome'
    end
  end

  # both create methods below work

  # def create
  #   user = User.find_by(name: params[:user][:name])
  #   user = user.try(:authenticate, params[:user][:password])
  #   return redirect_to(controller: 'sessions', action: 'new') unless user
  #   session[:user_id] = user.id
  #   @user = user
  #   redirect_to controller: 'welcome', action: 'home'
  # end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.nil? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

end
