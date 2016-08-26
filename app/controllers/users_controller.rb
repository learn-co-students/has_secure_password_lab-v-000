class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless user.save
    session[:user_id] = user.id
    flash[:notice] = "You have successfully signed up."
    redirect_to user

    ## Working solution using helpers in SessionsHelper module
    # user = User.create(user_params)
    # if user.password == user.password_confirmation
    #   log_in user
    #   flash[:notice] = "You have successfully signed up."
    #   redirect_to user
    # else
    #   redirect_to controller: 'users', action: 'new'
    # end
  end

  def show
    # @user = User.find_by(id: session[:user_id])
    current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
