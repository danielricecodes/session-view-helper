module SessionViewHelper
  def display_session_hash
  	"TEST!!!"
  end
end

if defined?(ActionController)  
  ActionController::Base.helper(SessionViewHelper)
end