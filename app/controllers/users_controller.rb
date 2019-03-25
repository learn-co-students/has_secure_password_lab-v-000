class UsersController < ApplicationController

  def new

  end

  def create
    if params[:password] == params[:password_confirmation]
      User.create(user_params)
    else 
      redirect_to(controller: 'users', action: 'new')
    end
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
   params.require(:user).permit(:name, :password, :password_confirmation)
 end

end
