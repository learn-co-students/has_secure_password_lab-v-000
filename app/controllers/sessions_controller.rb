class SessionsController < ApplicationController

  def new

  end

  def create

    user = User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless user

    login(user)

    @user = user

    redirect_to welcome_path

  end

end
