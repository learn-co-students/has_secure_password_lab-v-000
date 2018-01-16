class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    # Create the user with the supplied params
    @user = User.create(user_params)
    
    # If the user can be saved...
    if @user.save
      # Assign the session to the current user
      session[:user_id] = @user.id
      # And redirect to the welcome#home page
      redirect_to root_path
    else
      # ELSE redirect to the new user signup page
      redirect_to controller: 'users', action: 'new'
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
