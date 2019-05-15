class WelcomeController < ApplicationController
  before_action :require_logged_in
  
  def home
    @user = User.find_by(name: params[:name])
  end
end
