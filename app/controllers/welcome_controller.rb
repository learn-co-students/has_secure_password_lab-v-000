class WelcomeController < ApplicationController

  def welcome
    before_action :require_login
  end
end