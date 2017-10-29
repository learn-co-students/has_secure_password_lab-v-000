class WelcomeController < ApplicationController
  before_action :require_logged_in

  def home
    binding.pry
  end
end
