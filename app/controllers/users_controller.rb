class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation] && !params[:user][:password].blank? && !params[:user][:password_confirmation].blank?
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to welcome_index_path
      else
        redirect_to users_new_path
      end
    else
      redirect_to users_new_path
    end
  end

  private

  def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end


end
