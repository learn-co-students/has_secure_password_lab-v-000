class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def auth_pass(user)
      user.authenticate(user_params[:password])
  end

  def confirm_matching_pass
      user_params[:password] == user_params[:password_confirmation]
  end
end
