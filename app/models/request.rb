class Request < ActiveRecord::Base
  attr_accessible :author, :bclitem, :customer_id, :duedate, :location_id, 
                  :locationplaced, :oclcnum, :pub, :title
  
  belongs_to :customer
  belongs_to :location
  has_many :activities
  has_many :statuses, :through => :activities
  
  accepts_nested_attributes_for :activities
  
  validates :customer_id, presence: true
  validates :title, presence: true
  validates :locationplaced, length: { maximum: 3 }
  validates :location_id, presence: true
  validates :oclcnum, length: { maximum: 10 }
  
end
