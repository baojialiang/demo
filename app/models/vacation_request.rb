class VacationRequest < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  attr_accessible :leave_text, :remain_hours, :request_hours
end
