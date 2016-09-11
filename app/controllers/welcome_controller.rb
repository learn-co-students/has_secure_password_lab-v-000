class WelcomeController < ApplicationController
  before_action :login_required

  def index
    @user = User.find_by(id: current_user)
  end

  private

    def login_required
      redirect_to login_path unless !current_user.nil?
    end

    def current_user
      session[:user_id] ||= nil
    end

end
