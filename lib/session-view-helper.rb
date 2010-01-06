module SessionViewHelper
  def display_session_hash()
    if RAILS_ENV!='production'    	
      concat(tag(:div, :id => "dev_container"))
      concat(content_tag(:h2, 'Session Variables - Only renders in development mode')) 
      session.collect {|name, content| concat(content_tag(:p, "#{name}: #{truncate(content.to_s, :length=>75)}", :id => "session_#{name}")) }           
      concat('</div>')
    end
  end
end

if defined?(ActionController)  
  ActionController::Base.helper(SessionViewHelper)
end

#<div id="dev_container">
#  <h2>Session Variables - Only renders in development mode</h2>
#  <% session.each do |name, content| %>
#      <%= content_tag :p, "#{name}: #{truncate(content.to_s, :length=>75)}", :id => "session_#{name}" %>
#    <% end %>
#</div>