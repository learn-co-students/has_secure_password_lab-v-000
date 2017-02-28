class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    if user.try(:authenticate, params[:user][:password])
      set_current_user user
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

end
