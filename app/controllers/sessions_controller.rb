class SessionsController < ApplicationController
# SessionsController post create logs you in with the correct password
# SessionsController post create rejects invalid passwords
# SessionsController post create rejects empty passwords



 def create
   @user = User.find_by(username: params[:username])
   return head(:forbidden) unless @user.authenticate(params[:password])
   session[:user_id] = @user.id
 end
end
