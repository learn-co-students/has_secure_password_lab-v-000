class WelcomeController < ApplicationController

  def homepage
    if current_user.blank?
      redirect_to login_path
    else
      @user = User.find(current_user)
    end
  end

end
