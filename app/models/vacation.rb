class Vacation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  attr_accessible :leave_text, :remain_hours, :request_hours
  
  # v = Vacation.new(:leave_text => "hello", :remain_hours => 20, :request_hours => 10)
  
  
  
end
