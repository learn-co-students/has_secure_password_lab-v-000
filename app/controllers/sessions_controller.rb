class SessionsController < ApplicationController
  def new
  end
  def create
   user = User.find_by(:name => params[:user][:name])
   #redirect_to controller: 'sessions', action: 'new' and return if !user

   if !!user && user.authenticate(params[:user][:password]) #this doesnt work here.
     session[:user_id] = user.id
     return redirect_to controller:'users', action:'home'
   else
       flash[:message] = "Invalid username or password"
    redirect_to controller: 'sessions', action: 'new'
   end
end

  def destroy
    session.clear
    redirect_to controller: 'users', action:'home'
  end
end
