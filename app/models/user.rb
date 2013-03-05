class User < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :vacation_requests
  
  has_one :vacation
  
  attr_accessible :email, :password, :first_name, :last_name
  
  
  # a = User.new(:email=>"jialiang.bao@careerbuilder.com",:password=>"123",:first_name=>"jialiang",:last_name=>"bao")
end
