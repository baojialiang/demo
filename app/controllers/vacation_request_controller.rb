class VacationRequestController < ApplicationController
    layout "admin"
  
  def index
    
    list
    render("list", :layout => "application")
  end
  
  def list
    @vacation_requests = VacationRequest.all
    #render :action => "list", :layout => "application"
  end
  
  def show
    @vacation_request = VacationRequest.find(params[:id]) 
    
  end
  
  def new
    @vacation_request = VacationRequest.new
  end
  
  def create
    vacation_request = VacationRequest.new(params[:vacation_request])
    user = User.find_by_email(User.new(params[:user]).email)
    user.vacation_requests << vacation_request
    if user.save
      flash[:notice] = "vacation successfully requested"
      redirect_to(:action => "list")
    else
      flash[:error] = "vacation cannot be requested now, please try again"
      render("new")
    end
  end

  def edit
    @vacation_request = VacationRequest.find(params[:id]) 
  end
  
  def update
    @vacation_request = VacationRequest.find(params[:id])
    if @vacation_request.update_attributes(params[:vacation_request])
      flash[:notice] = "vacation successfully updated"
      redirect_to(:action => "show", :id => @vacation_request.id)
    else
      flash[:error] = "vacation cannot be updated now, please try again"
      render("edit")
    end
  end
  
  def delete
    @vacation_request = VacationRequest.find(params[:id])
    @vacation_request.destroy
    flash[:notice] = "deleted successfully"
    redirect_to(:action => "list")
  end
  
end
