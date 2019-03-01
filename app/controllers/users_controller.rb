class UsersController < ApplicationController

  def new
  end

  def create
     @user = User.create(user_params)
    # if set_your_password
      redirect_to "/users/new"
#    @user = User.find_by(name: params[:name])
#    return head(:forbidden) unless params[:password] == @user.password
    session[:user_id] = @user.id

  end



private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :password_digest)
  end

  def self.valid
    if password !=nil && password_confirmation !=nil
    #  session[:name] = params[:name]
      password == password_confirmation

    end
  end



end
