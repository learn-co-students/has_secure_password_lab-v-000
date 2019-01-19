class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end
