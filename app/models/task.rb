class Task < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 255 }

  validates :job_id,
    presence: true

  validates :sub_contractor_id,
    presence: true

  belongs_to :sub_contractor
  belongs_to :job
end
