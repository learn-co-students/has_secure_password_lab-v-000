class UsersController < ApplicationController
  before_action :require_logged_in, only: [:welcome]

  def new
    #@user to build around already set before_action by #current_user
    #renders users/new.html.erb
  end

  def create
    @user = User.create(user_params)
    return redirect_to signup_path unless @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def welcome
    #renders users/welcome.html.erb
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
