class SessionsController < ApplicationController
  def welcome
    @user = User.find(session[:user_id])
  end
end
