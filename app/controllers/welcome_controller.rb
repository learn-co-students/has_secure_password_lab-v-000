class WelcomeController < ApplicationController
  before_action :logged_in_redirect
  
  def home
  end

end
