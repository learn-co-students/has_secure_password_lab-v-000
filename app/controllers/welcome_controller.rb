class WelcomeController < ApplicationController
  before_action :authentication_required

  def hello
    session[:name]
  end
end
