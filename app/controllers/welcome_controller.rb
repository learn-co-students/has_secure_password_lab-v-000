class WelcomeController < ApplicationController
  before_action :require_logged_in

  def hello
    @user = current_user
  end

end
