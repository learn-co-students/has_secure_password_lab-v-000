class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(name: params[:user][:name], password: params[:user][:password])
    #binding.pry
    if @user.authenticate(params[:user][:password_confirmation])
      binding.pry
      session[:user_id] = @user.id
      redirect_to users_index_path
    else
      redirect_to users_new_path
    end
  end

  def index
  end
  

end
