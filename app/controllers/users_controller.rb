class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new # implicitly renders signup form  - app/views/users/new.html.erb
    @user = User.new
  end

  def create
    user = User.new(user_params) # instantiating user instance and setting its attribute values
    # via mass assignment from strong params (returned by calling #user_params)
    if user.save
      flash[:message] = "You have successfully registered!"
      session[:user_id] = user.id # log in the user
      redirect_to welcome_path
    else
      flash[:message] = "Your attempt to register was unsuccessful. Please try again."
      redirect_to controller: 'users', action: 'new' # presenting user with signup form again
    end
  end

  private

    def user_params # private method #user_params returns sanitized, strong params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
    # The params hash must have a top-level "user" key that points to
    # (and stores) the user hash nested inside of the params hash.
    # Within the user hash (nested inside of the params hash),
    # we permit the keys of "name", "password" and "password_confirmation",
    # which each points to its corresponding value entered in the signup form.
    # has_secure_password macro added password and password_confirmation fields to User model,
    # although we have a password_digest column in users table
    # A user instance must have its password attribute set to be successfully saved to DB
  end
