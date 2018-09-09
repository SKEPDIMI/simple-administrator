class SubContractor < ApplicationRecord
  validates :name,
    presence: true
  
  has_many :tasks, dependent: :destroy
  belongs_to :jobs
end
