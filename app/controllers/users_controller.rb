class UsersController < ApplicationController
  def create
    user = User.create(user_params)

    if user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id
      render :index
    else
      redirect_to '/users/new'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
