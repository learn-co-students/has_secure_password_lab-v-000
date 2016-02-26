class WelcomeController < ApplicationController

  def hello
    @user = User.find_by(id: session[:user_id])
  end

end
