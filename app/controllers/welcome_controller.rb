class WelcomeController < ApplicationController

  def home
    if current_user
      render 'welcome/home'
    else
      redirect_to login_path
    end
  end
end
