
class SessionsController < ApplicationController

	def new
	end

	def create

		if params[:user][:name] != nil && params[:user][:name] != ""
	        
			@user = User.find_by(name: params[:user][:name])
			
    		return head(:forbidden) unless @user.authenticate(params[:user][:password])
    		session[:user_id] = @user.id
             
		    redirect_to '/home'

		elsif session[:user_id] != [] && session[:user_id] != nil
			redirect_to '/home'
		else
			redirect_to '/login'
		end

	end

	def destroy
		session.delete :user_id
	end



end
