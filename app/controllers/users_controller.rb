
class UsersController < ApplicationController
    def new
    end
  
    

    def create
      #check if pw and confirmation match user.
      @user = User.create(user_params)
      
      #if pw and confirm don't match, then redirect to the UsersController#new (which sends to view/users/new)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      
      #if @user.save, then log in, set the session for this user, and redirect to the WelcomeController
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
  end