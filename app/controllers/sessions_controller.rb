class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:name])    
    if params[:password] == params[:password_confirmation]
		# return head(:forbidden) unless @user.authenticate(params[:password])    
    # session[:name] = params[:name]
    session[:user_id] = params[:id]
    redirect_to '/users/show'
    else redirect_to :new_user
    end
  end

  def destroy
    session.delete :user_id
  end
end
