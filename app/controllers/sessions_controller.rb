class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.authenticate(params[:user][:password])
      redirect_to :login
    else
      session[:user_id] = @user.id
      redirect_to :controller => :users, :action => 'create'
    end
  end

  def destroy

  end 

end
