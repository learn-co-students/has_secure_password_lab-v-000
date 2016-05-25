class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/users'
    else
      redirect_to '/users/new'
    end
  end

   def index
     @user = User.find(session[:user_id])
   end


   private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end

end
