class UsersController < ApplicationController
    attr_accessor :name

    def new
        # It should respond to new with the signup form,
    end

   
    def create
        # create by creating a new user.
        
       @user =  User.create(user_params)
 
       if @user.save
        
    #    alternavtive    user_params[:password] == user_params[:password_confirmation]
    #         @user= User.find_by(name: user_params[:name])
        session[:user_id] = @user.id
        redirect_to root_path
       else
        redirect_to new_users_path

       end


    end  



    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end


end
