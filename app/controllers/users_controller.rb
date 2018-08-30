class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      #binding.pry
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to new_user_path
    end

    #if @user && @user.authenticate(params[:password])
    #  session[:user_id] = @user.id
    #  redirect_to welcome_path
    #else
    #  render :new
    #end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
