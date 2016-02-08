class UsersController < ApplicationController

  def create
    @user = User.find_by_name(login_params[:name])
    if login_params[:password] != login_params[:password_confirmation]
      return redirect_to '/signup'
    end
    if @user
      if @user.authenticate(login_params[:password])
        session[:user_id] = @user.id
        redirect_to '/'
      end
    else
      @user = User.create(login_params)
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  def new
  end

  def index
  end

  private

  def login_params
    params.require("user").permit(:name, :password, :password_confirmation)
  end

end
