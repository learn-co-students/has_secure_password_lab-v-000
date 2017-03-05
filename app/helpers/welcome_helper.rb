module WelcomeHelper
  def welcome_user
    if logged_in?
      "Hi, #{current_user.name}"
    else
      "Hi, Guest"
    end
  end
end
