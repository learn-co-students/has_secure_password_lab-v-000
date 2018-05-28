class UsersController < ApplicationController
  def new
    # Creates a new object
    @user = User.new
  end

  def create
    # creates a new user and saves it to the database
    # routes user to the homepage in the WelcomeController if they exist
    # Checks to make sure the user's passwords match then saves it
    # to the databse
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'homepage'
    else
      # routes the user to the new user method in the UsersController if they don't exist
      redirect_to new_user_path
    end


  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
