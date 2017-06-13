class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_path)
    else
      redirect_to(signup_path)
    end
  end

  private
  def post_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
