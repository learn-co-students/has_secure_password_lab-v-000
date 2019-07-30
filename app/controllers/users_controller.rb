class UsersController < ApplicationController

    def new
        @user = User.new 
    end 

    def create 
      @user = User.new(user_params)
        if @user.password.present? && @user.password == @user.password_confirmation
            @user.save
        end 
      if @user.save 
        @user.login
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end 

    end 
        
private 
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 

    def login
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
        else 
            flash[:message] = "Unable to login"
        end 
    end 
end
