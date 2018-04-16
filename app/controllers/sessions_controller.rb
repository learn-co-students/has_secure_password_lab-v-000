class SessionsController < ApplicationController
    
   def new
   end
def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_welcome_path
    else
      redirect_to 'login'
    end
  end
end
#   def create
#     #   binding.pry
#     user = User.find_by(name: params["user"]["name"])
    
#      if !params["user"]["password"]
#     #     session[:user_id] == nil
#          redirect_to '/sessions/new'
#      end
#   user.try(:authenticate, params["user"]["password"])
#       if user
#     session[:user_id] = user.id
# end

   
    # @user.try(:authenticate, params[:password])
    # if @user
    #   session[:user_id] = @user.id
    # elsif !password.valid? || !password
     
