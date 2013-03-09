require 'digest/sha1'
class User < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :vacation_requests 
  has_one :vacation
 
  attr_accessible :email, :first_name, :last_name
  attr_protected :hashed_password
  attr_accessor :password
  
  ##############  validation ###################
  validates_presence_of :email
  validates_length_of :email, :within => 0..100
  validates_uniqueness_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email
  
  validates_presence_of :first_name
  validates_length_of :first_name, :within => 0..50
  
  validates_presence_of :last_name
  validates_length_of :last_name, :within => 0..50
  
  validates_length_of :password, :within => 6..25, :on => :create
  

  ############## before save and after save ####################
  before_save :create_hashed_password
  after_save :clear_password
  
  
  def self.authenticate(email = "", password = "")
    user = User.find_by_email(email)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end
  
  def password_match?(password)
    hashed_password == User.hash(password)
  end
  
  
  def self.hash(password = "")
    Digest::SHA1.hexdigest(password)
  end
  
  def create_hashed_password
    self.hashed_password = User.hash(password)
  end
  
  def clear_password
    password = nil
  end
  
  # a = User.new(:email=>"jialiang.bao@careerbuilder.com",:password=>"123",:first_name=>"jialiang",:last_name=>"bao")
end
