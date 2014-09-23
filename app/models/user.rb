class User < ActiveRecord::Base
  has_secure_password(validations: false)
  #attr_accessor :password, :password_confirmation
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length:{ maximum: 50 }
  #validates :password, length: { minimum: 6 }
  validates :password, presence: true,confirmation: true, length: { minimum: 6 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,presence: true, 
                   format: { with: VALID_EMAIL_REGEX }, 
                   uniqueness: { case_sensitive: false }
end
