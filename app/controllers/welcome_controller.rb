class WelcomeController < ApplicationController
  before_action :require_password
  def home
    current_user
  end


end
