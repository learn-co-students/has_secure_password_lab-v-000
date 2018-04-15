class SessionsController < ApplicationController
  
    
   def create
     if !params[:name] || params[:name].empty? || params[:password] != params[:password_confirmation]
       redirect_to '/users/new'
     else
    session[:user_id] = @user.id
    redirect_to "/welcome/welcome"
     end
   end
  
  def destroy
    if session[:name] != nil
    session.delete(:name)
  else
    session[:name] == nil
    end
    redirect_to root_path
  end
end
