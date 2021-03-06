class AccessController < ApplicationController
  layout "admin"
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout, :help]
  
  def index
    menu
    render("menu")
  end
  
  def login
    #login form
    if session[:user_id]
      redirect_to(:action => "menu")
    end
  end
  
  def logout
    #logout form
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice_info] = "You have logged out"
    redirect_to(:action => "login")
  end
  
  def menu
    @vacation = Vacation.find_by_user_id(session[:user_id])
    @chart_data =  @vacation.to_json
  end
  
  def attempt_login
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      session[:username] = user.first_name + " " + user.last_name
      flash[:notice_info] = "You are now Logged in"
      redirect_to(:action => "menu")
    else
      flash[:notice_error] = "Invalid Email/Password"
      redirect_to(:action => "login")
    end
  end
  
  def help
    
  end
  
end
