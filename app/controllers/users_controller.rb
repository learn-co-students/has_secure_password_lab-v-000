class UsersController < ApplicationController

  def index
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
      if params[:user][:password] == params[:user][:password_confirmation]
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'index'
      else
        redirect_to controller: 'users', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end