class Vacation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  attr_accessible :remain_hours
  
  # v = Vacation.new(:leave_text => "hello", :remain_hours => 20, :request_hours => 10)
  
  validates :remain_hours, :presence => true
  validates_numericality_of :remain_hours, :greater_than => 0, :only_integer => true
  
end
