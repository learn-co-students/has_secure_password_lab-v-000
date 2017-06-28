class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
    	session[:user_id] = @user.id
    	redirect_to homepage_path
    else
    	redirect_to new_user_path , alert: "User was not created, please insert info currectly" 
    end

  end

  def homepage
  	 if session.include? :user_id
  	 	@user = User.find_by(id: session[:user_id])
  	 	render 'homepage'
  	 else
  	 	redirect_to new_user_path
  	 end
  end

  private 
  
  def user_params
  	params.require(:user).permit(:name, :password, :password_confirmation )
  end
end
