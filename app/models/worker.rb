class Worker < ApplicationRecord
  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :pay,
    presence: true

  validates :sub_contractor_id,
    presence: true

  belongs_to :sub_contractor
end
