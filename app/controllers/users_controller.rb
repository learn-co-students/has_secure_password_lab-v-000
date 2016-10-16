class UsersController < ApplicationController

  def index
    @user = User.find([:id])
  end

  def create
    if !user_params.nil? && user_params != ""
    @user = User.new(user_params)
      if @user.save
        session[:user_id]= @user.id
        render :index
      else
        redirect_to signup_url
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
