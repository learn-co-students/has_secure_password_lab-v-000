module ApplicationHelper

  def show_name
    if @user&.name
      @user.name
    else
      link_to "Please login", login_path
    end
  end

end
