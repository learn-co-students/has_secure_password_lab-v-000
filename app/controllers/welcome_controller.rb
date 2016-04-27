class WelcomeController < ApplicationController
  before_action :require_logged_in

  def home
    #checks if logged in using before_action #require_logged_in
    #renders welcome/home.html.erb
  end
end
