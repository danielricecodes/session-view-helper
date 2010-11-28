module SessionViewHelper
  def display_session_hash()
      append_div_tag + append_header + append_session_info + append_close_div_tag
  end
  
  private
  def append_div_tag
    tag(:div, {:id => "dev_container", :style=>"width: 75%;margin: 0 auto;background-color: #aaa;padding: 20px 40px;border: solid 1px black;margin-top: 20px;color:black;"}, true, false)
  end
  
  def append_header
    content_tag(:h2, 'Session Variables - Only renders in development mode')
  end
  
  def append_session_info
    simple_format(session.to_yaml.gsub(' ', '&nbsp;'))
  end
  
  def append_close_div_tag
    "</div>".html_safe
  end
end

if defined?(ActionController)  
  ActionController::Base.helper(SessionViewHelper)
end