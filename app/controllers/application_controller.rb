class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def display_error_message object
    error_list = ''
    object.errors.full_messages.each do |error|
      error_list += error
      error_list += "<br />"
    end
    
    flash[:notice_error] = error_list
  end
  
end
