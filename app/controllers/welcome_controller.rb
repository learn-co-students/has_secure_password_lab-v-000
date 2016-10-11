class WelcomeController < ApplicationController
  before_action :authentication_required
end
