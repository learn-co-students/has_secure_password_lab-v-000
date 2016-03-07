class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id  
    else
      return head(:forbidden)
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end
 
end
