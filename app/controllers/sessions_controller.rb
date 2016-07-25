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
        flash[:notice] = "Incorect Login Information"
        redirect_to signup_path
      end
    end


end
