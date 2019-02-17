class WelcomeController < ApplicationController
  # before_action :require_logged_in

  def home
    if !logged_in?
      redirect_to new_user_path
    else
      render root
    end 
  end

end
