class UsersController < ApplicationController

  def create
    # binding.pry
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
    else
      redirect_to '/users/new'
    end

    # binding.pry

  end

  private

    def user_params(*args)
      # binding.pry

      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
