class WelcomeController < ApplicationController
  before_action :require_logged_in
  def home
    @user = User.find_by_id(session[:user_id])
  end
end