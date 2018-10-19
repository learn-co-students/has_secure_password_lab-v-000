class SessionsController < ApplicationController
    
    def create
        binding.pry
            @user = User.find_by(name: params[:name])
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)

    else
        redirect_to new_session_path

    end

end
