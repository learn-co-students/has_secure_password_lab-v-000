class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create


    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      render :homepage
    else
      redirect_to '/users/new'
    end
  end

  #def show
    #@user = User.find_by_id(:user_id)
    #render :homepage
  #end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
