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
      redirect_to(:action => 'login')
      return false
    else 
      return true
    end
  end
  
end
