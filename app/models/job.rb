class Job < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 255 }

  validates :start_data,
    presence: true

  validates :user_id, presence: true

  has_and_belongs_to_many :users # BELONGS to superintendent HAS MANY subcontractors
end
