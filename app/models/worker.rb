class Worker < ApplicationRecord
  validates :first_name,
    presence: true,
    length: { minimum: 1, maximum: 40}
  validates :last_name,
    presence: true,
    length: { minimum: 1, maximum: 40}
  validates :time_worked,
    presence: true
  validates :responsibility,
    presence: true,
    length: { minimum: 1, maximum: 40}

  belongs_to :task
end
