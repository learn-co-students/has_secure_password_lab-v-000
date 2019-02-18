class UsersController < ApplicationController
  def new
  end

  def welcome

  end

  def create
    #sign up
    if !(params[:user][:password]== params[:user][:password_confirmation])
      redirect_to action: 'new'
    else
      @user = User.create(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to  'welcome'
      else
        redirect_to 'new'
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
