class UsersController < ApplicationController
    helper_method :login

    def new
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to :welcome
        else
          redirect_to :signup
        end
    
    end 

    def show
       @user = User.find_by(id: session[:user_id])
    end 
    
        
private 
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 

    def login(user)
        if user && user.authenticate(@user.password)
            session[:user_id] = user.id 
        else 
            flash[:message] = "Unable to login"
        end 
    end 
end
