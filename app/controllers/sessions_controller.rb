class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:name] == nil || params[:name].empty?
      redirect_to login_path
    else
      @user = User.find_by(name: params[:name])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to users_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :name
  end
end
