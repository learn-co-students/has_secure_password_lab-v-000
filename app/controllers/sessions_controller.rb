class SessionsController < ApplicationController
  def login
    @user = User.new # I wonder about this, since I'm calling the User model.
    # Maybe this belongs in the UsersController.
  end
  
  def create
    @user = User.find_by_name(params[:user][:name])

    if @user.try(:authenticate, params[:user][:password])
      raise @user.inspect
    else
      raise "Not a valid user."
    end
  end

  def destroy
    # For the fun of it, make a flash message here that tells users when they've successfully logged out.
    # I will need to display it in the application.html.erb file if I do this.
  end
end
