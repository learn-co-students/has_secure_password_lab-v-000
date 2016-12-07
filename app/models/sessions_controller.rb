class SessionsController < ApplicationController
  def create
    if params[:user][:password].nil?
      redirect_to '/signup'
    else
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/signup'
      end
    end
  end
end
