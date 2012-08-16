class Customer < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :userid
  has_many :requests

  validates :firstname, :lastname, presence: true
  validates :userid, presence: true, uniqueness: true

end
