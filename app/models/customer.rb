class Customer < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :userid
  has_many :requests

  accepts_nested_attributes_for :requests

  validates :firstname, :lastname, presence: true
  validates :userid, presence: true, uniqueness: true

  def full_name
    [firstname, lastname].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.firstname = split.first
    self.lastname = split.last
  end



end
