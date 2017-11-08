class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

  def destroy
    if !session[:name]
      session[:name] == nil
    else
      session.delete :name
    end
    redirect_to '/login'
  end
end