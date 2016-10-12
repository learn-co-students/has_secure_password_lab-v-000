class SessionsController < ApplicationController
 	
  	def create
    user = User.find_by_name(params[:user][:name])
    # puts "user found #{user.name}"
     # puts "are params even #{params}"
    # If the user exists AND the password entered is correct.
    # puts "password params #{params[:user][:password]}"
    # puts "authenticated #{user.authenticate(params[:user][:password])}"
    if user && user.authenticate(params[:user][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      # puts "wat"
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end

  end
end
