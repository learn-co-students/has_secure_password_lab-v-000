class SessionsController < ApplicationController

    def create 
        @user = User.find_by(name: params[:user][:name])

        #figure out - is the @user password_confirmation supposed to be nil?
        # I think it is due to security reasons, but google
        # also, research how .authenticate authenticates a user password
        
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
        else 
            head(:forbidden)
        end 
    end

end
