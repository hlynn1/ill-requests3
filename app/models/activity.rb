class Activity < ActiveRecord::Base
  attr_accessible :note, :status_id, :request_id
  belongs_to :request
  belongs_to :status
  
  validates :request_id, presence: true
  default_scope order: 'activities.status_id ASC'
  
end
