class UsersController < ApplicationController
  def new
    #@user to build around already set before_action by #current_user
    #renders users/new.html.erb
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render welcome_path
    else
      redirect_to signup_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
