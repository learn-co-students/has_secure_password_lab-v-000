class UsersController < ApplicationController
    
    def index
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(post_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/show'
        else
            redirect_to '/signup'
        end
    end
    
    def show
        @user = User.find_by(session[:user_id])
    end
    
    private
    
    def post_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end