class UsersController < ApplicationController

  def new
  render 'create'
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Please make sure you've filled all fields correctly"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

    private

    def user_params
      params.require("user").permit(:name, :password, :password_confirmation)
    end

end
