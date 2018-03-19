class UsersController < ApplicationController

  def new
    #application controller already defines the current user with the before_action
  end
  def create
    #binding.pry
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      #redirect_to @user
      redirect_to controller: "welcome", action: 'home'
    else
      #redirect_to root_path
      redirect_to controller: "users", action: 'new'
    end

    #solution below
    #@user = User.create(user_params)
    #return redirect_to controller: 'users', action: 'new' unless @user.save
    #session[:user_id] = @user.id
    #redirect_to controller: 'welcome', action: 'home'

  end
#the show command was not in the solution
#  	def show
#  		if session.include? :user_id
#  			@user = User.find(params[:id])
#  			render :show
#  		else
#  			redirect_to new_user_path
#  		end
#  	end

#the destroy action was not in the soluition
#  def destroy
#      session.delete :user_id
#      redirect_to '/'
#  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
