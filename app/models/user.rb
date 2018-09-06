class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :first_name,
    presence: true,
    length: { minimum: 1, maximum: 40}
  validates :last_name,
    presence: true,
    length: { minimum: 1, maximum: 40}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  
  validates :email,
    presence: true,
    length: { minimum: 1, maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  validates :phone,
    presence: true

  validates :role,
    presence: true

  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 5, maximum: 255 }
    
  has_many :permissions, dependent: :destroy
  has_many :job
  has_many :tasks
end
