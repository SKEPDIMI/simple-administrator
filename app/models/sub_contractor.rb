class SubContractor < ApplicationRecord
  validates :name,
    presence: true
  
  has_many :tasks, dependent: :destroy
  has_many :jobs, through: :tasks
end
