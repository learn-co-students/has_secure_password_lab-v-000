class SessionsController < ApplicationController

    def create
        @user = User.find_by(:name => params[:user][:name])
        
        if @user.verifiy(params)
            session[:user_id] = @user.id
            redirect_to '/users/show'
        else
            redirect_to '/'
        end

    end


end
# rails g model User name:string password:string password_confirmation:string -no-assets --no-test-framework
