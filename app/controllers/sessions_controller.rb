class SessionsController < ApplicationController
	def new
	end

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    if @user.authenticate(params[:user][:password])
    	session[:user_id] = @user.id
    	redirect_to root_path
    else
    	return head(:forbidden)
    end
  end

  # {"user"=>{"name"=>"Connie", "password"=>"M4heswaran"},  "controller"=>"sessions",  "action"=>"create"}


end
