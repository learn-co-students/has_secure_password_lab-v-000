class WelcomeController < ApplicationController
  def home
    @user = current_user
    redirect_to login_path, alert: "Please login first!" if !current_user

  end
end
