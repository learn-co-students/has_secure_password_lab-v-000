module SessionsHelper

  def errors?(user)
    !!user && user.errors.present?
  end

  def display_errors(user)
    if errors?(user)
      content_tag(:div, user_errors(user))
    else
      nil
    end
  end
end
