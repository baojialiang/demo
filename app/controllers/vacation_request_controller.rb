class VacationRequestController < ApplicationController
  layout "admin"
  
  before_filter :confirm_logged_in
  
  def index   
    list
    render("list", :layout => "admin")
  end
  
  def list
    if params[:id].blank?
      user_id = session[:user_id]
    else
      user_id = params[:id]  
    end
    
    display_num = 10
    @page = current_page
    @page_num = ((VacationRequest.where(:user_id => user_id).count).to_f / display_num).ceil
    
    
    @vacation_requests = VacationRequest.where(:user_id => user_id)
                        .order("created_at DESC")
                        .offset(display_num * (@page - 1))
                        .limit(display_num)
    @vacation = Vacation.find_by_user_id(user_id)
    #render :action => "list", :layout => "application"
  end
  
  def show
    @vacation_request = VacationRequest.find_by_id(params[:id]) 
    
  end
  
  def new
    vacation = Vacation.find_by_user_id(session[:user_id])
    
    if !flash[:notice_error].blank?
      
    elsif vacation.remain_hours > 0
       flash[:notice_info] = "You have #{vacation.remain_hours} hours"
    else
       flash[:notice_warning] = "You have used all vacation hours"
    end

    @vacation_request = VacationRequest.new
  end
  
  def create
    vacation_request = VacationRequest.new(params[:vacation_request])
    user = User.find(session[:user_id])
    if !vacation_request.request_hours.blank? && !vacation_request.leave_text.blank?
        user.vacation.remain_hours -= vacation_request.request_hours
        vacation_request.remain_hours = user.vacation.remain_hours
        user.vacation_requests << vacation_request
    else
        flash[:notice_error] = "request hours or content cannot be blank"
        redirect_to(:action => "new")
        return
    end

    if vacation_request.save && user.vacation.save
      flash[:notice_info] = "vacation requested"
      redirect_to(:action => "list")
      return
    else
      display_error_message(user.vacation)
      display_error_message(vacation_request)
      redirect_to(:action => "new")
      return
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
