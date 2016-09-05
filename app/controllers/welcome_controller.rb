class WelcomeController < ApplicationController
  def home
    if !!current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end
end
