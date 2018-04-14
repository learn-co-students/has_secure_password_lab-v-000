class SessionsController < ApplicationController
  helper_method :current_user
  
    
   def create
     if !params[:name] || params[:name].empty?
       redirect_to '/sessions/new'
     else
    session[:name] = params[:name]
    redirect_to "/application/index"
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
