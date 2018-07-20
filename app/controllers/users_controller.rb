class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(name: params[:user][:name], password: params[:user][:password])
    binding.pry
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to users_index_path
  end

  def index
  end
  

end
