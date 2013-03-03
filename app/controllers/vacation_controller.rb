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
  
end
