class WelcomeController < ApplicationController
  def index
    @user = session[:name]
  end
end
