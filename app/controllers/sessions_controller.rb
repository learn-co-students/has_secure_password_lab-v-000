class SessionsController < ApplicationController

  def create
    @user = User.find_or_create(params)
    session[:user_id] = @user.id
  end

end
