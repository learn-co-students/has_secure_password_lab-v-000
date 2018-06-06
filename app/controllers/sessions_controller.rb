class SessionsController < ApplicationController

  def create
    if params[:user][:password] && params[:user][:password] != ''
      if @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/users/welcome'
      else
        
        redirect_to '/new'
      end
    else
      redirect_to '/new'
    end
  end

end