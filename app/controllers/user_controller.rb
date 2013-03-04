class UserController < ApplicationController
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(:action => "list")
    else
      render("new")
    end
  end
  
  def list
    @users = User.all
  end
  
end
