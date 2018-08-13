class UsersController < ApplicationController
  before_action :require_login, only: [:home]

  def new
  end

  def create
    user = User.new(user_params)
    return redirect_to new_user_path unless user.save
    session[:user_id] = user.id
    redirect_to '/'
  end

  def home
    @current_user = User.find_by(id: session[:user_id]).name
    render '/users/home'
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
