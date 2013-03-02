class Vacation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  attr_accessible :leave_text, :remain_hours, :leave_hours
  
  # v = Vacation.new(:leave_text => "hello", :remain_hours => 20, :leave_hours => 10)
  
  
  
end
