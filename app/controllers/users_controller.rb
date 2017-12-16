class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.password = params[:user][:password]
      if @user.save
        session[:user_id] = @user.id
        redirect_to "users_path"
      else
        render :new
      end
    else
      redirect_to "/users/new"
    end
  end
end
