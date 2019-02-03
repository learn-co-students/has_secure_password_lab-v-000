class WelcomeController < ApplicationController
  before_action :require_login

  def show

  end

  def current_user
  session[:name] = params[:user][:name]
end

  def require_login
      redirect_to :controller => 'sessions', :action => 'new' unless current_user
  end

end
