class WelcomeController < ApplicationController
  before_action :require_login

  def homepage
    @user = User.find(params[:id])
  end

end
