class SessionsController < ApplicationController
  before_action :require_login, only: :destroy

    def create
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      return redirect_to login_path unless user

      session[:user_id] = user.id
      redirect_to root_path
    end

    def destroy
      session.delete :user_id
      redirect_to root_path
    end

  private

    def session_params
      params.require(:user).permit(:name, :password)
    end

end
