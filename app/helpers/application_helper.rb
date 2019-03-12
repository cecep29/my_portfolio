module ApplicationHelper
  def login_helper style
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) + 
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
       link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    greeting = "Thank for visiting me from #{session[:source]} and you on #{layout_name} layout"
    if session[:source] 
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator name, msg
    "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
  end
end
