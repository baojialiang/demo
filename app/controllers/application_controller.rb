class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def display_error_message object
    if object.nil?
      return
    end
    if object.errors.full_messages.blank?
      return
    end
    
    error_list = '<ul id="info_ul">'
    object.errors.full_messages.each do |error|
      error_list += "<li>"
      error_list += error
      error_list += "</li>"
    end
    error_list += '</ul>'

    flash[:notice_error] = error_list
    
  end
  
  def current_page
      page = params[:page]
      if page.blank?
        page = 1
      end
      return page.to_i
  end
  
  protected
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice_info] = "Please log in"
      redirect_to(:controller => "access",:action => 'login')
      return false
    else 
      return true
    end
  end
  
end
