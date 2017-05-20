class SessionsController < ApplicationController
	def create
		user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless params[:user][:password] == user.password
		# binding.pry
	  session[:user_id] = user.id
	  redirect_to user_path(user)
	end
end
