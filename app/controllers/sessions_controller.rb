class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #binding.pry
    end
  end

end
