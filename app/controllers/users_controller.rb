class UsersController < ApplicationController
  # def create
  #   if params[:password] == params[:password_confirmation]
  #     user = User.new(user_params).save
  #     session[:user_id] = @user.id
  #     redirect_to greeting_path
  #   else
  #     redirect_to new_user_path
  #   end
  # end

  def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to root_path
            else
                redirect_to new_user_path
            end
    end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
