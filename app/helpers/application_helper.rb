module ApplicationHelper
  def login_logout_links
    if session.include? :user_id
      form_tag sessions_destroy_path do
        submit_tag "Log Out"
      end
    else
      link_to "Log In", new_session_path
    end
  end
end
