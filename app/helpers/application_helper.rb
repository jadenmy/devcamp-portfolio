module ApplicationHelper
  def login_helper style = ''
     if current_user.is_a?(GuestUser) 
       (link_to "Sign Up", new_user_registration_path, class: style) +
       " ".html_safe +
       (link_to "login", new_user_session_path, class: style) 
     else 
       link_to "Logout", destroy_user_session_path, method: :delete, class: style
     end 
  end
  
  def source_helper(layout_name)
    if session[:source] 
      content_tag(:p, "Thanks for visiting me from  #{session[:source]} and you are on the #{layout_name} layout", class: "source-greeting") 
    end 
  end
  
  def copyright_generator
    YoungViewTool::Renderer.copyright 'Jaden Young', 'All rights reserved'
  end
end
