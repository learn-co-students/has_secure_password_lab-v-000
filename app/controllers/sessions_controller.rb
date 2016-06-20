class SessionsController < ApplicationController
  def new
  end

  def create
      if params[:user][:password].blank?
        redirect_to '/login'
      else
       @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end
  end

  def destroy
  end

  
end
