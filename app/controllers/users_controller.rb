class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to root_path
            else
                redirect_to 'signup'
            end
        else
            redirect_to new_user_path
        end
    end 


    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

end 