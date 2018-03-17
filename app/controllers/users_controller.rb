class UsersController < ApplicationController

  def new
      #
    #  @user = User.new
  end
  def create
    #binding.pry
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      #redirect_to @user
      redirect_to controller: "welcome", action: 'home'  
    else
      redirect_to root_path
      #redirect_to controller: "users", action: 'new' unless session[:name]
    end
  end


  def destroy
      session.delete :user_id
      redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
