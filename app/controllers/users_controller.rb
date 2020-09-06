class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if !@user.save
      redirect_to new_user_path
    else
    authenticated = @user.try(:authenticate, params[:user][:password])
        if authenticated
           session[:user_id] = @user.id
           redirect_to '/'
        else   
           redirect_to '/login'
        end
      end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
