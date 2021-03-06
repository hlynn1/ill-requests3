class Location < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :requests
  
  validates :name, presence: true
end
