class WelcomeController < ApplicationController
  def show
    if !logged_in?
      redirect_to login_path
    end
  end
end
