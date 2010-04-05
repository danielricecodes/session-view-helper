module SessionViewHelper
  def display_session_hash()
      append_div_tag + append_header + append_session_info + append_close_div_tag
  end
  
  private
  def append_div_tag
    tag(:div, {:id => "dev_container"}, true, false)
  end
  
  def append_header
    content_tag(:h2, 'Session Variables - Only renders in development mode')
  end
  
  def append_session_info
    retstr = ""
    session.collect {|name, content| retstr << content_tag(:p, "#{name}: #{truncate(content.to_s, :length=>75)}", :id => "session_#{name}") }
    return retstr
  end
  
  def append_close_div_tag
    '</div>'
  end
end

if defined?(ActionController)  
  ActionController::Base.helper(SessionViewHelper)
end