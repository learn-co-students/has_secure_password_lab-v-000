class SessionsController < ApplicationController
  
  def new

  end

  def create
    user=User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
    return redirect_to login_path unless user 
    login(user.id)
    @user=user
    redirect_to root_path 
  end

  def destroy
    session.delete[:user_id]
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end
end
