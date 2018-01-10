class UsersController < ApplicationController


  def new

  end

  def create
    if password_match?
      user = User.create(user_params)
    # binding.pry
      session[:user_id] = user.id
      redirect_to users_show_path
    else
      redirect_to users_new_path
    end
  end

  def show
    if @user = User.find_by(id: current_user_id)
      render 'show'
    else
      redirect_to login_path
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def password_match?
        params[:user][:password] == params[:user][:password_confirmation]
    end

end
