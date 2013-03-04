class VacationController < ApplicationController
  
  def index
    list
    render("list")
  end
  
  def list
    @vacations = Vacation.all
    #render("vacation/list")

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
      redirect_to(:action => "list")
    else
      render("new")
    end
  end
  
end
