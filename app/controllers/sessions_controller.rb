class SessionsController < ApplicationController
  before_action :logged_in?

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
  end

  private

  def logged_in?
    redirect_to login_path unless current_user
  end
end
