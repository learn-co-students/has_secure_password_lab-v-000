class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to welcome_index_path
    end

    def destroy
        if session.include? :user_id
            session.delete :user_id
        end
    end

    private
    def sessions_params
        params.require(:user).permit(:name, :password)
    end
end