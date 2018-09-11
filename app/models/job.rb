class Job < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 255 }

  validates :start_date,
    presence: true

  validates :project_manager_id, # jobs need a project manager
    presence: true

  belongs_to :superintendent, foreign_key: 'superintendent_id', class_name: 'User'
  belongs_to :project_manager, foreign_key: 'project_manager_id', class_name: 'User'

  has_many :tasks, dependent: :destroy
  has_many :sub_contractors, -> { distinct }, through: :tasks
end
