class UsersController < ApplicationController



  def new
    @user = User.new
    render '/users/signup'
  end

  def create
   @user = User.new(user_params)
   return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end

end
