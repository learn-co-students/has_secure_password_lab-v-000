class SessionsController < ApplicationController

  def new
  end
  
  def create

    if user = User.find_by(:name => params[:user][:name]).try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
    else
      redirect_to new_user_path
    end
  end

end
