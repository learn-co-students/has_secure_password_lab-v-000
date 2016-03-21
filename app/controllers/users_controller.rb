class UsersController < ApplicationController
  # Handles signup and deletion

  # signup_path
  def new
  end

  # create_user_path
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

  # delete_user_path
  def destroy
    if logged_in?
      @user.destroy
      session.delete :user_id
    end

    redirect_to login_path
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end