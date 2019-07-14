class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    user = User.new(user_params)

    if user.save
      # should probably log them in. do it manually for now
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      redirect_to users_new_path
    end
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
