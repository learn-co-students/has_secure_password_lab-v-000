class SessionsController < ApplicationController
    
     def new

     end

    def create
              @user = User.find_by(name: params[:user][:name])
                    #if it has not been saved to the database yet, then you will not find it in the database
             if @user.save
                    return head(:forbidden) unless @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id
                    redirect_to root_path
             else
                redirect_to new_session_path

             end

   end

end
