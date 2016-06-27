class SessionsController < ApplicationController
  def new
  end

     def create
        @user = User.find(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
      end
end
