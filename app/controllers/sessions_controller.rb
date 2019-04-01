class SessionsController < ApplicationController

  def create
    # binding.pry
    # @user = User.find_by_name(params[:user][:name])
    @user = User.find_by_name(params[:user][:name])
    # binding.pry
    # binding.pry
    # if (params[:user][:password] == @user.password) && @user.authenticate(@user.password)
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      # binding.pry
      redirect_to '/sessions/new'
    end
    # session[:user_id] = @user.id
  end

end
