class VacationRequest < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  attr_accessible :leave_text, :remain_hours, :request_hours
  
  #REQUEST_HOURS_REGEX = /^\d$/
  
  validates :request_hours, :presence => true
  
  validates :user, :presence => true
  
  validates_inclusion_of :user, :in => User.all, :message => " is not valid"
  
  validates_numericality_of :request_hours, :less_than => :remain_hours, :greater_than => 0, :only_integer => true
  
end
