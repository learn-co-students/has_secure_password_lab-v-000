class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    binding.pry
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      redirect_to login_path
    end

  end

  def destroy
  end

end
