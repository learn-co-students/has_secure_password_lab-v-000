class UsersController < ApplicationController
  def new
    if !current_user.nil?
      redirect_to '/welcome'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by(id: current_user)
    return head(:forbidden) unless !@user.nil?
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
