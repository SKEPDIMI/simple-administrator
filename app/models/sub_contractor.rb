class SubContractor < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: true
  
  has_many :tasks
  has_many :jobs, through: :tasks
end
