class Request < ActiveRecord::Base
  attr_accessible :author, :bclitem, :customer_id, :dateplaced, :duedate, :location_id, :locationplaced, :oclcnum, :pub, :title
  belongs_to :customer
end
