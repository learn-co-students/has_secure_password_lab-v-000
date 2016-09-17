class WelcomeController < ApplicationController

  def hello
    @user = User.find(session[:user_id])
  end
end
