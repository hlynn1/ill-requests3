class Location < ActiveRecord::Base
  attr_accessible :code, :name
  validates :name, presence: true
end
