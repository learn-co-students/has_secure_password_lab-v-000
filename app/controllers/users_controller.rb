class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.save 
      session[:user_id] = user.id
      redirect_to :controller => 'users', :action => 'hello'
    else
      redirect_to :controller => 'users', :action => 'new'
    end
  end

  def hello
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
