class UserController < ApplicationController
  before_action :validate_password_confirmation, only: :create

  def new
    #renders signup form
  end

  def create
    #creates user and logs them in
    user = User.new(user_params)
    if user.save #needs to validate that password and confirmation match
      session[:user_id] = user.id
      redirect_to '/homepage'
    else
      redirect_to '/signup'
    end
  end

  def index
  end

  def homepage
    @user = User.find_by(name: params[:name])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def validate_password_confirmation
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/signup'
    end
  end
end
