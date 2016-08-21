class SessionsController < ApplicationController



  def create 
    @user = User.find_by(name: params[:session][:name])
    return head(:forbidden) unless @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id 
    redirect_to '/users/show'
  end

  def destroy
    session.delete :name
  end

 
end
