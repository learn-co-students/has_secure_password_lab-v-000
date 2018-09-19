class SessionsController < ApplicationController
  def destroy
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      current_user
      render :'welcome/show'
    else
      redirect_to root_path
    end
  end

  def new
  end
end
