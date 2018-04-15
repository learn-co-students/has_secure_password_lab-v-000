class SessionsController < ApplicationController
   def new
   end
  
  def create
    @user = User.find_by(name: params[:name])
     @user = @user.try(:authenticate, params[:password])
    return head(:forbidden) unless @user
    session[:user_id] = @user.id
    redirect_to '/welcome/welcome'
  end
end
