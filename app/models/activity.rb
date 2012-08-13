# == Schema Information
#
# Table name: activities
#
# id          :integer (not null, primary key)
# request_id  :integer (foreign key)
# status_id   :integer (foreign key)
# created_at  :datetime
# updates_at  :datetime
#

class Activity < ActiveRecord::Base
  attr_accessible :request_id, :status_id, :date, :note
end