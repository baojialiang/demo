class VacationRequestController < ApplicationController
  layout "admin"
  
  before_filter :confirm_logged_in
  
  def index   
    list
    render("list", :layout => "admin")
  end
  
  def list
    display_num = 10
    @page = current_page
    @page_num = ((VacationRequest.where(:user_id => session[:user_id]).count).to_f / display_num).ceil
    @vacation_requests = VacationRequest.where(:user_id => session[:user_id])
                        .order("created_at DESC")
                        .offset(display_num * (@page - 1))
                        .limit(display_num)
    #render :action => "list", :layout => "application"
  end
  
  def show
    @vacation_request = VacationRequest.find_by_id(params[:id]) 
    
  end
  
  def new
    @vacation_request = VacationRequest.new
  end
  
  def create
    vacation_request = VacationRequest.new(params[:vacation_request])
    user = User.find(session[:user_id])
    vacation_request.user = user
    if vacation_request.save
      flash[:notice_info] = "vacation requested"
      redirect_to(:action => "list")
    else
      flash[:notice_error] = "vacation cannot be requested now, try again later"
      render("new")
    end
  end

  def edit
    @vacation_request = VacationRequest.find(params[:id]) 
  end
  
  def update
    @vacation_request = VacationRequest.find(params[:id])
    if @vacation_request.update_attributes(params[:vacation_request])
      flash[:notice_info] = "vacation successfully updated"
      redirect_to(:action => "show", :id => @vacation_request.id)
    else
      flash[:notice_error] = "vacation cannot be updated now, please try again"
      render("edit")
    end
  end
  
  def delete
    @vacation_request = VacationRequest.find(params[:id])
    @vacation_request.destroy
    flash[:notice_info] = "deleted successfully"
    redirect_to(:action => "list")
  end

end
