class SessionsController < ApplicationController
  before_action :set_user, only: [:show, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(password: params[:password])
    session[:user_id] = @user.id
    redirect_to session_path(@user)
  end

  def show
  end

  def set_user
    @user = User.find_by(name: params[:name])
  end
end
