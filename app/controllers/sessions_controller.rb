class SessionsController < ApplicationController


  def new
  end


  def create
    user = User.find_by(name: params[:name])
    authenticated =  user.try(:authenticate, params[:password])
    return redirect_to users_path unless authenticated
    @user = user
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
    end


  def destroy
    session.delete :name
    redirect_to root_path
  end

end
