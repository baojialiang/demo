class UserController < ApplicationController
  layout "admin"
  
  def index
    list
    render("list")
  end
  
  def new 
    @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    user.vacation = Vacation.new
    
    if user.save
      flash[:notice_info] = "Register success, welcome! " + user.first_name 
      session[:user_id] = user.id
      session[:username] = user.first_name + " " + user.last_name
      redirect_to(:controller => "access", :action => "menu")
    else
      display_error_message user
      render("new")
    end
  end
  
  def list
    @users = User.all
  end
  
  def register
    new
    render("new")
  end
  
end
