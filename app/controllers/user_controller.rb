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
      flash[:notice] = "user successfully registered"
      redirect_to(:action => "list")
    else
      render("new")
    end
  end
  
  def list
    @users = User.all
  end
  
end
