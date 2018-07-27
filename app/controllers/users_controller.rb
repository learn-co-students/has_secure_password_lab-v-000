class UsersController < ApplicationController



  def new
  end



  def create
    @user = User.create(user_params)
    return redirect_to signup_path unless @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end


  def home
  end

  private

  def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
 end

end
