class Vacation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  attr_accessible :leave_text, :remain_days
  
end
