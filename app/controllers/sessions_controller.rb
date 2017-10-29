class SessionsController < ApplicationController
	before_action :require_login, only: :destroy
	def new
		@user = User.new		
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		if @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to '/'
		else	
			render :new
		end		
	end

	def destroy		
		session.delete :user_id		
		redirect_to login_path
	end

	private	
	def session_params
		params.require(:user).permit(:name, :password)
	end

	def require_login
		return head(:forbidden) unless session.include? :user_id
	end
end
