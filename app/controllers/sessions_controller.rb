class SessionsController < ApplicationController
	def new
		# login page
	end

	def create
		if params[:password].nil?
			redirect_to login_path
		else
			@user = User.find_by(name: params[:name])
			if @user.authenticate(params[:password])
				session[:user_id] = @user.id
				redirect_to root_path, notice: "Thanks for loggin-in mate"
			else
				redirect_to(login_path, alert: 'wrong password')
			end
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path, notice: "Sad to see you go"
	end
end