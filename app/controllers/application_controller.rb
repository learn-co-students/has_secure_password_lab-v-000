class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
     before_action :current_user
    
    def current_user
    @user = session[:user_id] || User.new
  end
  
    def login
        current_user.id != nil
    end
    
     def require_login
    return redirect_to(controller: 'sessions', action: 'new') unless login?
  end
end

  

