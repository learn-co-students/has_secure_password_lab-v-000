class WelcomeController < ApplicationController
  before_action :require_login

  def index
    @user = User.find_by(sessions[:user_id])
  end

end
