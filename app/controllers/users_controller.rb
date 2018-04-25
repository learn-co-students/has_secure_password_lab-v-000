class UsersController < ApplicationController
  before_action :require_login, only: [:index]

  def show
    @user = User.find(session[:user_id])
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(name: params[:user][:name],
                      password: params[:user][:password])
      user.save
      session[:user_id] = user.id
      redirect_to users_url
    else
      redirect_to new_users_url
    end
  end

  def new
    @user = User.new
  end

  private

  def require_login
    redirect_to root_url unless session.include? :user_id
  end
end
