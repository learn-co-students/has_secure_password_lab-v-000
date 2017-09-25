class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params).save

    if user
      @user = User.find_by(name: user_params[:name])
      return head(:forbidden) unless @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to controller: 'users', action: 'new'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
