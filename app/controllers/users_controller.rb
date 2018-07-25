class UsersController < ApplicationController


  def homepage
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to new_user_url
    end
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:name]
      if !params[:user][:name].empty?
        if params[:user][:password] == params[:user][:password_confirmation]
          @user = User.create(name: params[:user][:name], password: params[:user][:password])
          session[:user_id] = @user.id
          redirect_to homepage_url
        else
          redirect_to new_user_url
        end
      else
        redirect_to new_user_url
      end
    else
      redirect_to new_user_url
    end
  end
end
