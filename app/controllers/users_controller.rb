class UsersController < ApplicationController

  def index
    render :text => 'hello'
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/users' 
      else
        redirect_to '/users/new'
      end
    else
      redirect_to '/users/new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
