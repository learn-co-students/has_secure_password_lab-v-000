class User < ActiveRecord::Base

  has_secure_password


  def new
  end

  def create
    @user= User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
