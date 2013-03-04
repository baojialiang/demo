class VacationController < ApplicationController
  
  layout "admin"
  
  def index
    
    list
    render("list", :layout => "application")
  end
  
  def list
    @vacations = Vacation.all
    #render :action => "list", :layout => "application"
  end
  
  def show
    @vacation = Vacation.find(params[:id]) 
    
  end
  
  def new
    @vacation = Vacation.new
  end
  
  def create
    @vacation = Vacation.new(params[:vacation])
    if @vacation.save
      flash[:notice] = "vacation successfully requested"
      redirect_to(:action => "list")
    else
      flash[:notice] = "vacation cannot be requested now, please try again"
      render("new")
    end
  end

  def edit
    @vacation = Vacation.find(params[:id]) 
  end
  
  def update
    @vacation = Vacation.find(params[:id])
    if @vacation.update_attributes(params[:vacation])
      flash[:notice] = "vacation successfully updated"
      redirect_to(:action => "show", :id => @vacation.id)
    else
      flash[:notice] = "vacation cannot be updated now, please try again"
      render("edit")
    end
  end
  
  def delete
    @vacation = Vacation.find(params[:id])
    @vacation.destory
    flash[:notice] = "deleted successfullys"
    redirect_to(:action => "list")
  end
  
  
end
