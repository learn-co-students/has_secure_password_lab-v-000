class UsersController < ApplicationController
  def new

  end

  def create
    u_params = users_params
    u = User.new(u_params)
    if u.save
      session[:user_id] = u.id
      redirect_to users_homepage_path
    else
      redirect_to users_signup_path
    end
  end

  def homepage
    render inline: "Hi, #{User.find_by(id: session[user_id]).name}"
  end

  private

    def users_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
