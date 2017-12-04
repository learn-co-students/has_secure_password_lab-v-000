class UsersController < ApplicationController

  def welcome
    return redirect_to '/signup' if !session[:user_id]
    render :welcome
  end

  def new
    render :signup
  end

  def create
    # raise params.inspect
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render :welcome
    else
      redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
