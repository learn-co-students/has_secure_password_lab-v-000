module ApplicationHelper
    def current_user
        user = User.find(session[:user_id])
        user.name
    end
end
