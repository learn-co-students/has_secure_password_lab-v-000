class SessionsController < ApplicationController

  def new
    render 'users/login'
  end

  def create
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:notice] = "Invalid Login Information, Try Again."
        redirect_to login_path
      end
    end


    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end


end
