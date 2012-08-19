class Activity < ActiveRecord::Base
  attr_accessible :note, :status_id
  belongs_to :request
  
  validates :request_id, presence: true
  default_scope order: 'activities.status_id DESC'
end
