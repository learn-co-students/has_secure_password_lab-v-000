class UsersController < ApplicationController
  # def create
  #   user = User.create(user_params)
  #
  #   if user.try(:authenticate, params[:user][:password])
  #     binding.pry
  #
  #       session[:user_id] = user.id
  #     render :index
  #   else
  #     redirect_to '/users/new'
  #   end

def create 
   @user = User.new(user_params) 
     if @user && @user.password == @user.password_confirmation 
       @user.save 
       flash[:success] = "You have successfully signed up and logged in" 
       session[:user_id] = @user.id 
       # welcome 
     else 
       # flash[:error] = "You must signup before logging in" 
       redirect_to '/users/new' 
     end 
   end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
