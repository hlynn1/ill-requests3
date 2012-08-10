class Customer < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :userid
end
