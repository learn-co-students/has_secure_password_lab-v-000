# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/using-has_secure-password-lab
# new code start
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  end

  # def destroy
  #  session.delete :user_id
  #  redirect_to '/'
  # end
end
# new code end
