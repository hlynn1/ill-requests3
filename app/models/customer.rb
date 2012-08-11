class Customer < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :userid
  has_many :requests
end
