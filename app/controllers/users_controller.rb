class  UsersController < ApplicationController
    
    before_action :require_login, only: [:show]
    
    def new
        
    end
    
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/welcome'
        else
            redirect_to '/users/new'
        end
    end
    
    def show
        #require logged in
    end
    
    private
 
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
    def require_login
      redirect_to '/' unless session.include? :user_id 
    end
    
end