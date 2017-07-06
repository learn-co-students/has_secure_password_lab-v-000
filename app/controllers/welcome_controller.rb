class WelcomeController < ApplicationController
  before_action :require_login

  def index
    @user = User.find(params[:id])
  end
end
