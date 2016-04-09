class SessionsController < ApplicationController
  
  def new

  end

  def create
    @user=User.find_by(name: user_params[:name])
    return head[:forbidden] unless user_params[:password] == @user.password
    login(@user.id)
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
