class WelcomeController < ApplicationController
  before_action :require_login

  def hello
  end


  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
  
end
