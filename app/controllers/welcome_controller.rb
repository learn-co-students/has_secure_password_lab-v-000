class WelcomeController < ApplicationController

  def hello
    @user = User.find_by_id(session[:user_id])
  end
end
