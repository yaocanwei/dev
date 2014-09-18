class User < ActiveRecord::Base
  #attr_accessor :password, :password_confirmation
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length:{ maximum: 50 }
  validates :password, length: { minimum: 6 }
  #validates :password, presence: true,confirmation: true
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true, 
                   format: { with: VALID_EMAIL_REGEX }, 
                   uniqueness: { case_sensitive: false }
end
