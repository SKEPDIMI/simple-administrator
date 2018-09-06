class Task < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 255 }

  belongs_to :user
  has_many :workers #, dependent: :destroy ? has many workers, when the task is deleted so are the workers
end
