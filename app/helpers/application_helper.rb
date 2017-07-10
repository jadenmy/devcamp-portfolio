module ApplicationHelper
  def login_helper
     if current_user.is_a?(User) 
       link_to "Logout", destroy_user_session_path, method: :delete 
     else 
       (link_to "Sign Up", new_user_registration_path) +
       "<br>".html_safe +
       (link_to "login", new_user_session_path) 
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
