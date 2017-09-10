class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    
    # if @user.password == @user.password_confirmation
    #   @user.save
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    # else
    #   redirect_to new_user_path
    # end
    @user = User.create(user_params)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
