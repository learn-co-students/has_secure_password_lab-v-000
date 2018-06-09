class SessionsController < ApplicationController 
	def create 
		@user = User.find_by(name: params[:user][:name] )
		@pass = params[:user][:password] 
		@result = @user.try(:authenticate, @pass)
		if @result
			session[:user_id] = @user.id 
		else 
			session[:user_id] = nil;
		end 
	end 
end
