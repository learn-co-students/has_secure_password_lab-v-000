class UsersController < ApplicationController
  def new
  end

  def create
    user == User.create(user_params)
    if !user.save
      return redirect_to controller: 'users', action: 'new'
    else
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end
end
