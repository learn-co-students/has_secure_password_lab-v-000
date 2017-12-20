class UsersController < ActionController::Base

  def welcome
  end

  def new

  end

  def create
    if params[:user][:name] && (params[:user][:password] == params[:user][:password_confirmation])
      @user = User.create(user_params)
      session[:user_id] = @user.id
      render :welcome
    else
      redirect_to new_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
