class Status < ActiveRecord::Base
  has_many :activities
  has_many :requests, :foreign_key => "current_status"
  
end
