class UsersController < ApplicationController

  def new

  end

  def create
    User.create(user_params)
  end

  def homepage
    if current_user
      render(controller: 'users', action:'homepage')
    else
      redirect_to(controller: 'users', action: 'login')
    end
  end

  private

 def user_params
   params.require(:user).permit(:username, :password, :password_confirmation)
 end

end
