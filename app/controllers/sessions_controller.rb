class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: user_params[:name])
    if @user.authenticate(user_params[:password])
      self.current_user=(@user.id)
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
