require 'chronic'

class Request < ActiveRecord::Base
  attr_accessible :author, :bclitem, :customer_id, :duedate, :location_id, 
                  :locationplaced, :oclcnum, :pub, :title, :dateplaced, :chronic_duedate
  
  belongs_to :customer
  belongs_to :location
  belongs_to :status, :foreign_key => "current_status"
  has_many :activities
  
  accepts_nested_attributes_for :activities

  after_touch :check_current_status
  
  validates :customer_id, presence: true
  validates :title, presence: true
  validates :locationplaced, length: { maximum: 3 }
  validates :location_id, presence: true
  validates :oclcnum, length: { maximum: 10 }

  scope :active, where(:current_status => [1..4])
  
  
  def self.here(current_location)
    where(:locationplaced => current_location).includes(:status)
  end

  def self.by_column(sort, direction)
    includes(:customer).order("#{sort} #{direction}")
  end

  def chronic_duedate
    self.duedate
  end
  
  def chronic_duedate=(s)
    self.duedate = Chronic.parse(s) if s    
  end

  private
  
    def check_current_status
      latest_activity = Activity.where("request_id = ?", id).maximum("status_id")
      unless self.current_status == latest_activity
        self.update_column(:current_status, latest_activity)
      end
    end
    
end
