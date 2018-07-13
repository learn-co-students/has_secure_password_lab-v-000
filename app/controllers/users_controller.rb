class UsersController < ApplicationController
  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to controller: "sessions", action: "new"
    end
  end
  
  def new
  end
  
  def create
    user = User.create(user_params)
    if !user.save
      return redirect_to controller: "users", action: "new"
    else
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
