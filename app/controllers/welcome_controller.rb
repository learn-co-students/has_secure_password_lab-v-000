class WelcomeController < ApplicationController

  def home
    @user = User.find_by(name: session[:name])
  end
end
