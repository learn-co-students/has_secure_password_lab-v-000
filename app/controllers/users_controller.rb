class UsersController < ApplicationController

  def home
  	return :login unless (@user = current_user)
  end

  def create
  	#binding.pry
  	@user =User.new(name: user_params[:name])
  	if user_params[:password] == user_params[:password_confirmation]
  	  @user.password= user_params[:password]
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end





  private
    def current_user
     User.find_by(id: session[:user_id])
    end

    def user_params
    	params.require(:user).permit(:name,:password,:password_confirmation)
    end


end
