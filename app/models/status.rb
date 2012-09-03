class Status < ActiveRecord::Base
  has_many :activities
  has_many :requests, :through => :activities
  
end
