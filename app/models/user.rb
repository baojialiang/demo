class User < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :email, :password, :first_name, :last_name
end
