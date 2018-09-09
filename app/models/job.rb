class Job < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 255 }

  validates :start_date,
    presence: true

  validates :user_id, # the superintendent id
    presence: true

  belongs_to :user # BELONGS to superintendent
  has_many :sub_contractors
  has_many :tasks, dependent: :destroy
end
