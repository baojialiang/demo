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
    @user = User.new(params[:user])
    @user.vacation = Vacation.new
    
    if @user.save
      flash[:notice_info] = "user successfully registered, login please"
      redirect_to(:controller => "access", :action => "list")
    else
      display_error_message @user
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
