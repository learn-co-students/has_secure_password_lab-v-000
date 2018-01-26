class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: :home
  
  def home # implicity renders app/views/static_pages/home.html.erb, website homepage
  end
end
