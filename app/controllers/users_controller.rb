class UsersController < ApplicationController
  def new
  end

 def create
   #  create user
   @user = User.create(user_params)
   #  set the session
   #set the session

     if @user.save
        session[:user_id] = @user.id
       #   will redirect to login
       flash[:notice] = "User successfully created"
       redirect_to controller: 'users', action: 'new'

       #  redirect_to "http://www.google.com"

     else
       # redirect to signup
       redirect_to controller: 'users', action: 'new'
     end


 end

 private

 def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
 end

end
