class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if valid_signup
      @user = User.create(user_params)
      session[:user_id] = @user.id 
      redirect_to '/'
    else  
      redirect_to '/signup'  
    end  
  end


  private

  def valid_signup
    user = params[:user]
    valid_name = (user[:name] && user[:name] != "")
    valid_password = user[:password] && user[:password] == user[:password_confirmation] && user[:password] != ""
    valid_password && valid_name
  end 

  def user_params
    params.require(:user).permit(:name, :password)
  end

end #ends class
