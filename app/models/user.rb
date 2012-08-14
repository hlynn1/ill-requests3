class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :locationcode
  has_secure_password
  
  before_save { |user| user.locationcode = locationcode.upcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :locationcode, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  
  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
