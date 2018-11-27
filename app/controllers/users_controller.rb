class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:name] and params[:user][:name] != "" and params[:user][:password]  and params[:user][:password] != ''
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to welcome_index_path
      else
        flash[:alert] = @user.errors.full_messages.join(", ")
        redirect_to signup_path
      end
    else
      flash[:alert] = "A name and password must be entered"
      redirect_to signup_path
    end
  end



  private

  def user_params
    params.require(:user).permit([:name, :password, :password_confirmation])
  end
end
