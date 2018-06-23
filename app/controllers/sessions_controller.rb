class SessionsController < ApplicationController


  def create
    @user = User.find_by(name: new_params[:name])
    return head(:forbidden) unless @user.authenticate(new_params[:password])
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  private
  def new_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end

end
