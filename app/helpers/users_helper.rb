module UsersHelper
  def post_errors(user)
    if user.errors.present?
      content_tag(:ul, :class=> nil) do
        user.errors.full_messages.collect do |msg|
          content_tag(:li, msg)
        end.join.html_safe
      end
    end 
  end

end
