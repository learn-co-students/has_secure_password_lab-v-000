class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception #came standard with rails g
  before_action :current_user  #defined below, and occurs before all actions take place
        def current_user
          @user = (User.find_by(id: session[:user_id]) || User.new)
        end

        def logged_in?
          current_user.id != nil
        end

        #lets send the user to a login screen if they arent logged in
        def require_logged_in
          return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
        end

end
