class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_home_path(@user)
    else
      flash[:message] = "Your password is incorrect."
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id if session[:user_id].present?
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end