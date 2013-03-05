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
    @vacation_requests = VacationRequest.new(params[:vacation_request])
    user = User.find_by_email(User.new(params[:user]).email)
    @vacation_requests.user = user
    if @vacation_requests.save
      flash[:notice] = "vacation successfully requested"
      redirect_to(:action => "list")
    else
      flash[:notice] = "vacation cannot be requested now, please try again"
      render("new")
    end
  end

  def edit
    @vacation_request = VacationRequest.find(params[:id]) 
  end
  
  def update
    @vacation_request = VacationRequest.find(params[:id])
    if @vacation_request.update_attributes(params[:vacation])
      flash[:notice] = "vacation successfully updated"
      redirect_to(:action => "show", :id => @vacation_requests.id)
    else
      flash[:notice] = "vacation cannot be updated now, please try again"
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
